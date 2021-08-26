import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/user.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _otp;
  UserData _userFromFirebase(var user) {
    return user != null ? UserData(user) : UserData(null);
  }

  Stream<UserData> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future createWithPhone(String phone, BuildContext context) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 30),
        verificationCompleted: (PhoneAuthCredential phoneCredential) {
          _auth.signInWithCredential(phoneCredential).then((authResult) {
            return _userFromFirebase(authResult.user);
          });
        },
        verificationFailed: (FirebaseAuthException exption) {
          print(exption);
          return null;
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Enter OTP from SMS"),
                    content: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onChanged: (Value) {
                            _otp = Value.toString();
                          },
                        ),
                      ],
                    ),
                    actions: [
                      FlatButton(
                          color: Colors.deepOrangeAccent,
                          onPressed: () {
                            final _credential = PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: _otp.toString());
                            _auth
                                .signInWithCredential(_credential)
                                .then((authResult) {
                              return _userFromFirebase(authResult.user);
                            });
                          },
                          child: Text("Submit"))
                    ],
                  ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        });
  }

  Future deleteAccount() async {
    return _auth.signOut();
  }
}
