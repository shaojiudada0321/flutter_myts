
import 'package:flutter_myts/model/user.dart';

class Api {
  Future<void> sensSms(String mobile) async {
    print('发送验证码...');
    await Future.delayed(Duration(seconds: 1));
    print('发送验证码成功');
  }

  /// 用户登录。简单起见，返回User
  // Future<User> login(String mobile, String sms) async {
  //   print('登录中...');
  //   await Future.delayed(Duration(seconds: 1));
  //   User user = User(1, '程序员磊哥');
  //   print('登录成功: $user');
  //   return user;
  // }

  /// 直接将网络请求的 Future 对象包装成 Stream 返回
  /// Stream.fromFuture 等构造方法。更多细节参考官方文档
  /// 因为是 demo 所以用 Future.delayed 模拟请求过程
  Stream<int> login(dynamic data) => Stream.fromFuture(
    Future.delayed(Duration(seconds: 2), () {
      if (data["username"] == "123" && data["password"] == "123")
        return 0;
      return -1;
    }),
  );


  /// 用户登录。简单起见，返回User
  Future<User> login1(String mobile, String sms) async {
    print('登录中...');
    await Future.delayed(Duration(seconds: 1));
    User user = User(1, '程序员磊哥');
    print('登录成功: $user');
    return user;
  }
}