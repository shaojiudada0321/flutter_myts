import 'package:flutter/material.dart';

class HotPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HotPageWidgetState();
  }
}

class HotPageWidgetState extends State<HotPageWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("热销"),
        ),
        body: Center(
          child: Icon(Icons.business_center,size: 130.0,color: Colors.blue),
        )
    );
  }
}