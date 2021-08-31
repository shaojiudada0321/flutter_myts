import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HealthyPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HealthyPageWidgetState();
  }
}

class HealthyPageWidgetState extends State<HealthyPageWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("说健康"),
        ),
        body: Center(
            child: RaisedButton(
              child: Text("开启后台任务"),
              onPressed: () {
                startService();
              },
            )
        )
    );
  }
  void startService() async {
    if (Platform.isAndroid) {
      var methodChannel = MethodChannel("com.example.flutter_myts");
      String data = await methodChannel.invokeMethod("startService");
      print('data: ${data}');
    }
  }
}