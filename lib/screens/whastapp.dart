import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/calssScreen.dart';
import 'package:whatsapp_clone/screens/cameraScreen.dart';
import 'package:whatsapp_clone/screens/chatsScreen.dart';
import 'package:whatsapp_clone/screens/statusScreen.dart';
import 'package:whatsapp_clone/services/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Whatsapp extends StatefulWidget {
  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade400,
        title: Text('Vaarta'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ListView(
                        children: [
                          FlatButton(
                            onPressed: () async {
                              await FirebaseAuthService().deleteAccount();
                              Navigator.pop(context);
                            },
                            child: Text("Delete Account."),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [CameraScreen(), ChatsScreen(), StatusScreen(), CallScreen()],
      ),
    );
  }
}
