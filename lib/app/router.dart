import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_myts/ui/login.dart';
import 'package:flutter_myts/ui/tab/home.dart';

import 'route_paths.dart';

class MyRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case RoutePaths.HOME:
        return MaterialPageRoute(builder: (_) => HomePageWidget());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('没有找到对应的页面：${settings.name}'),
                  ),
                ));
    }
  }

}
