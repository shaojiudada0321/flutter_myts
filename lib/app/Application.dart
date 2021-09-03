import 'package:fluro/fluro.dart';

import '../main.dart';

class Application{
  //static Router router;
  static getContext(){
    return navigatorKey.currentState.overlay.context;
  }
}