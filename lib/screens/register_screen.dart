import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/whastapp.dart';
import 'package:whatsapp_clone/services/registration.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String dropdownValue = '+1';
  String otp = "**";
  String numberMobile = "";
  FirebaseAuthService _firebaseService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'img/form.png',
                ),
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Register yourSelf!",
                    style: TextStyle(
                        fontSize: 25, color: Colors.deepOrangeAccent.shade400),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("*Kindly Enter your 10 digit mobile Number:"),
              Text(
                " Choose your currect Country and Enter currect Mobile Number.*",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Country Code: ',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent.shade400,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    iconSize: 50,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepOrangeAccent),
                    underline: Container(
                      height: 2,
                      color: Colors.deepOrangeAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['+1', '+91', '+62', '+223', '+61']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefix: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "(" + dropdownValue + ")",
                        style: TextStyle(fontSize: 18),
                      ),
                    )),
                onChanged: (Value) {
                  setState(() {
                    numberMobile = Value.toString();
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              FlatButton(
                  onPressed: () async {
                    await _firebaseService.createWithPhone(
                        dropdownValue + numberMobile, context);
                  },
                  color: Colors.deepOrangeAccent,
                  child: Text("Get OTP")),
              SizedBox(
                height: 25,
              ),
              Text(
                "If you did not get OTP, kindly re-submit correct required elements.",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ]),
      )),
    );
  }
}
