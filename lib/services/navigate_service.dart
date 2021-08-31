import 'package:flutter/material.dart';

class NavigateService{
  final GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');

  NavigatorState? get navigator => key.currentState;

  get pushNamed => navigator!.pushNamed;
  get push => navigator!.push;

  /**
   * 通过 key.currentState 获取到 NavigatorState 实例。
   *  我这里简单暴露了导航的 push 和 pushName 功能，后期可以根据自己的功能来进行扩展。
   */
}