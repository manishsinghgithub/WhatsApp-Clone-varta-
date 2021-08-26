import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/Models/user.dart';
import 'package:whatsapp_clone/Models/wrapper.dart';
import 'package:whatsapp_clone/screens/welcome_Page.dart';

import 'package:whatsapp_clone/services/registration.dart';
import 'Models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserData>.value(
      value: FirebaseAuthService().user,
      initialData: UserData.InitialData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

/*
 SHA1: 43:55:85:80:A8:20:1B:25:9C:EB:5E:F0:CE:FC:5B:D7:B2:44:EE:C3

 SHA256: A2:BD:22:38:47:56:0C:68:93:49:05:B7:CC:85:81:51:EE:45:E8:9D:F3:E4:28:22:CB:15:9C:3D:BA:39:A8:16

 */
