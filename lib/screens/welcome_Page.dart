import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/register_screen.dart';
import 'package:whatsapp_clone/screens/whastapp.dart';

class WellcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Welcome to Varta.",
              style: TextStyle(
                  color: Colors.deepOrangeAccent.shade200,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'img/1st.png',
            width: 300,
            height: 300,
            //color: Colors.deepOrangeAccent.shade100,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 20),
            child: Text(
              'There is no Policy and Privacy here, just use this app and enjoy',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              color: Colors.deepOrangeAccent.shade200,
              child: Text(
                'Agree and Continue',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
