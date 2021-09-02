import 'dart:async';

import 'package:flutter_myts/net/api.dart';

import 'base_view_model.dart';
import '../common/view_state.dart';

class MyHomeViewModel extends BaseModel {

  MyHomeViewModel({Api api}) : super(api: api);

  Future<void> loadData() async {
    print('加载首页数据...');
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 2));
    setState(ViewState.Idle);
    print('加载首页数据完成');
  }

}