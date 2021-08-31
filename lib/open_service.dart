import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class openService extends StatefulWidget{
  @override
  _openServiceState createState() => _openServiceState();
}

class _openServiceState extends State {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
//Navigator.pushNamed(context, ‘/openService’);
        startService();
      },
      child: Text('打开后台服务'),
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