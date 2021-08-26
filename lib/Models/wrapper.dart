import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/Models/user.dart';
import 'package:whatsapp_clone/screens/welcome_Page.dart';
import 'package:whatsapp_clone/screens/whastapp.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    //either auth or home page.
    if (user.user == null) {
      return WellcomePage();
    } else {
      return Whatsapp();
    }
  }
}
