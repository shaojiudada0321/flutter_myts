import 'package:flutter/material.dart';

import 'tab/healthy.dart';
import 'tab/home.dart';
import 'tab/hot.dart';
import 'tab/my.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BottomNavigationWidgetState();
  }
}


class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  List<Widget> _pageList = [
    HomePageWidget(),
    HotPageWidget(),
    HealthyPageWidget(),
    MyInfoPageWidget(),
  ];

  /*设置底部标签*/
  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.spa),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      title: Text('商城'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.perm_identity),
      title: Text('我的'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    /*返回一个脚手架，里面包含两个属性，一个是底部导航栏，另一个就是主体内容*/
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items:_list,
        //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
        currentIndex: _currentIndex,
        //这是点击属性，会执行带有一个int值的回调函数，这个int值是系统自动返回的你点击的那个标签的位标
        onTap: (int i) {
          //进行状态更新，将系统返回的你点击的标签位标赋予当前位标属性，告诉系统当前要显示的导航标签被用户改变了。
          setState(() {
            _currentIndex = i;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: _pageList[_currentIndex],
    );
  }
}