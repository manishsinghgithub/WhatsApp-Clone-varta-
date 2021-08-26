import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent.shade400,
        onPressed: () {},
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
