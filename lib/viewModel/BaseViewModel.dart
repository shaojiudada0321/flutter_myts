import 'package:flutter/widgets.dart';

///所有viewModel的父类，提供一些公共功能
///author:liuhc
abstract class BaseViewModel {

  bool _isFirst = true;

  bool get isFirst=>_isFirst;

  @mustCallSuper
  void init(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      doInit(context);
    }
  }

  ///获取数据
  @protected
  Future refreshData(BuildContext context);

  @protected
  void doInit(BuildContext context);

  void dispose();
}
/*这个类，我封装了基本所有viewModel都需要的一些方法，那个init方法的作用是为了保证doInit只执行一次，
这样做省去了所有子类都判断一下是否已经执行过init，子类只需要重写doInit就可以保证方法里的代码只执行一次。*/