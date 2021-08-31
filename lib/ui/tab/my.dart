import 'package:flutter/material.dart';

class MyInfoPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyInfoPageWidgetState();
  }
}

class MyInfoPageWidgetState extends State<MyInfoPageWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Center(
        child: Icon(Icons.mood,size: 130.0,color: Colors.blue),
      ),
    );
  }
}