import 'package:flutter/material.dart';
import 'package:flutter_myts/net/api.dart';
import 'package:flutter_myts/services/custom_navigator_observer.dart';
import 'package:flutter_myts/ui/index.dart';

import '../main.dart';

class LoginViewModel with ChangeNotifier{

  final _model = Api();
  int state = 0; // 0 未请求，1 正在请求， 2 请求成功， 3请求失败
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var _isShowPwd = false;//是否显示密码
  var _isShowClear = false;//是否显示输入框尾部的清除按钮

  //焦点
  FocusNode  focusNodeUserName = new FocusNode();
  FocusNode  focusNodePassWord = new FocusNode();
  // 监听焦点
  Future<Null> _focusNodeListener() async{
    if(focusNodeUserName.hasFocus){
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      focusNodePassWord.unfocus();
    }
    if (focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      focusNodeUserName.unfocus();
    }
  }
  login() {
    final data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    /// 不为 0 说明上一条请求未完成，直接退出
    //if (state != 0) return;

    /// 开始请求，state 赋值为 1， 并通知监听者
    /// 如果用rxDart插件，可作为doOnListen参数的函数体
    //state = 1;
    //notifyListeners();

    _model.login(data)
      .listen((v) {
      if (v != 0) {
        /// 返回值不为0，请求失败
        state = 3;
        notifyListeners();
        Future.delayed(Duration(seconds: 1), () {
          state = 0;
          notifyListeners();
        });
      } else {
        /// 返回值为0，请求成功
        loginSuccess(navigatorKey.currentState!.overlay!.context);
      }
    });
  }
  loginSuccess(context){
    Future.delayed(Duration(microseconds: 0), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return BottomNavigationWidget();
        }),
      );
    });
  }
}