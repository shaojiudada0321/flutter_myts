import 'package:flutter/material.dart';
import 'package:flutter_myts/net/api.dart';
import 'package:flutter_myts/ui/index.dart';
import 'package:flutter_myts/viewModel/base_view_model.dart';

import '../main.dart';

class LoginViewModel extends BaseModel{


  LoginViewModel({Api api}) : super(api: api);

  //final _model = Api();
  //int state = 0; // 0 未请求，1 正在请求， 2 请求成功， 3请求失败
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

    api.login(data)
      .listen((v) {
      if (v != 0) {

      } else {
        /// 返回值为0，请求成功
        loginSuccess(navigatorKey.currentState.overlay.context);
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
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