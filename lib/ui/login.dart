import 'package:flutter/material.dart';
import 'package:flutter_myts/viewModel/login_view_model.dart';
import 'package:provider/provider.dart';

import 'index.dart';

class LoginWidget extends StatelessWidget{

  //焦点
  // FocusNode _focusNodeUserName = new FocusNode();
  // FocusNode _focusNodePassWord = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = '';//用户名
  var _username = '';//密码
  var _isShowPwd = false;//是否显示密码
  var _isShowClear = false;//是否显示输入框尾部的清除按钮

  /**
   * 验证用户名
   */
  String? validateUserName(value){
    // 正则匹配手机号
    RegExp exp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '用户名不能为空!';
    }else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }

  /**
   * 验证密码
   */
  String? validatePassWord(value){
    if (value.isEmpty) {
      return '密码不能为空';
    }else if(value.trim().length<6 || value.trim().length>18){
      return '密码长度不正确';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<LoginViewModel>(context);

    // logo 图片区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      // 设置图片为圆形
      child: Column(
        children: [
          Image.asset(
            "images/homepage.png",
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          new Container(
            child: Text("互助康", style: TextStyle(
                color: Color.fromRGBO(51, 51, 51, 1), fontSize: 32.0),),
            margin: EdgeInsets.only(top: 10.0),
          ),
          new Container(
            child: Text("助力健康中国·共同防癌", style: TextStyle(
                color: Color.fromRGBO(166, 166, 166, 1), fontSize: 18.0),),
            margin: EdgeInsets.only(top: 5.0),
          ),
        ],
      ),
      // child: ClipOval(
      //   child: Image.asset(
      //     "images/homepage.png",
      //     height: 100,
      //     width: 100,
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );

    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white
      ),
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new TextFormField(
              controller: provider.usernameController,
              focusNode: provider.focusNodeUserName,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "用户名/手机号/邮箱",
                hintText: "请输入手机号码",
                prefixIcon: Icon(Icons.phone_iphone),
                //尾部添加清除按钮
                suffixIcon: (_isShowClear)
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // 清空输入框内容
                    _userNameController.clear();
                  },
                )
                    : null,
              ),
              //验证用户名
              validator: validateUserName,
              //保存数据
            ),
            new TextFormField(
              controller: provider.passwordController,
              focusNode: provider.focusNodePassWord,
              decoration: InputDecoration(
                  labelText: "密 码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock_outline),
                  // 是否显示密码
                  suffixIcon: IconButton(
                    icon: Icon(
                        (_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    // 点击改变显示或隐藏密码
                    onPressed: () {
                      // setState(() {
                      //   _isShowPwd = !_isShowPwd;
                      // });
                    },
                  )
              ),
              obscureText: !_isShowPwd,
              //密码验证
              validator: validatePassWord,
              //保存数据
            )
          ],
        ),
      ),
    );

    // 登录按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 45.0,
      child: new RaisedButton(
        color: Color.fromRGBO(198, 241, 213, 1),
        child: Text(
          "登 陆",
          style: Theme
              .of(context)
              .primaryTextTheme
              .headline,
        ),
        // 设置按钮圆角
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45.0)),
        onPressed: provider.login

        // onPressed: () {
        //   //点击登录按钮，解除焦点，回收键盘
        //    _focusNodePassWord.unfocus();
        //    _focusNodeUserName.unfocus();
        //
        //   // if (_formKey.currentState.validate()) {
        //   //   //只有输入通过验证，才会执行这里
        //   //   _formKey.currentState.save();
        //   //   //todo 登录操作
        //   //   print("$_username + $_password");
        //   // }
      ),
    );

    //忘记密码  立即注册
    Widget bottomArea = new Container(
      margin: EdgeInsets.only(right: 30, left: 20),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "注册",
              style: TextStyle(
                color: Color.fromRGBO(142, 142, 142, 1),
                fontSize: 14.0,
              ),
            ),
            //忘记密码按钮，点击执行事件
            onPressed: () {

            },
          ),
          FlatButton(
            child: Text(
              "找回密码",
              style: TextStyle(
                color: Color.fromRGBO(142, 142, 142, 1),
                fontSize: 14.0,
              ),
            ),
            //点击快速注册、执行事件
            onPressed: () {

            },
          )
        ],
      ),
    );

    //第三方登录区域
    Widget thirdLoginArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 80,
                height: 1.0,
                color: Colors.grey,

              ),
              Text(
                  '第三方登录'
              ),
              Container(
                width: 80,
                height: 1.0,
                color: Colors.grey,
              ),
            ],
          ),
          new SizedBox(
            height: 18,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                color: Colors.green[200],
                // 第三方库icon图标
                icon: Image.asset(
                  "images/weixin.png",
                  fit: BoxFit.cover,
                ),
                iconSize: 40.0,
                onPressed: () {

                },
              ),
              // IconButton(
              //   color: Colors.green[200],
              //   icon: Icon(FontAwesomeIcons.facebook),
              //   iconSize: 40.0,
              //   onPressed: (){
              //
              //   },
              // ),
              // IconButton(
              //   color: Colors.green[200],
              //   icon: Icon(FontAwesomeIcons.qq),
              //   iconSize: 40.0,
              //   onPressed: (){
              //
              //   },
              // )
            ],
          )
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body: new GestureDetector(
        onTap: (){
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          provider.focusNodePassWord.unfocus();
          provider.focusNodeUserName.unfocus();
        },
        child: new ListView(
          children: <Widget>[
            new SizedBox(height: 60,),
            logoImageArea,
            new SizedBox(height: 50,),
            inputTextArea,
            new SizedBox(height: 50,),
            loginButtonArea,
            new SizedBox(height: 20,),
            bottomArea,
            new SizedBox(height: 30,),
            thirdLoginArea,
          ],
        ),
      ),
    );
  // @override
  // Widget build(BuildContext context) {
  //   final provider = Provider.of<LoginViewModel>(context);
  //   return Scaffold(
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         TextField(
  //           controller: provider.usernameController,
  //           decoration: InputDecoration(labelText: "username"),
  //         ),
  //         TextField(
  //           controller: provider.passwordController,
  //           decoration: InputDecoration(labelText: "password"),
  //         ),
  //         RaisedButton(
  //           onPressed: provider.login,
  //
  //           /// 根据 state 的值，按钮显示不同内容。
  //           child: provider.state == 0
  //               ? Text("login")
  //               : provider.state == 1
  //               ? CircularProgressIndicator()
  //               : provider.state == 2
  //               ? loginSuccess(context)
  //               : Icon(Icons.cancel),
  //         ),
  //       ],
  //     ),
  //   );
  }



  loginSuccess(context){
    Future.delayed(Duration(milliseconds: 200), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return BottomNavigationWidget();
        }),
      );
    });
  }
}