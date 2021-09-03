import 'package:flutter/material.dart';
import 'package:flutter_myts/app/Application.dart';
import 'package:flutter_myts/common/view_state.dart';
import 'package:flutter_myts/model/user.dart';
import 'package:flutter_myts/net/api.dart';
import 'package:flutter_myts/viewModel/base_view_model.dart';

class ProductViewModel extends BaseModel{

  ProductViewModel({Api api}) : super(api: api);

  User user;

  Future<void> initData() async {
    print('加载首页数据...');
    setState(ViewState.Busy);
    //user = ModalRoute.of(Application.getContext()).settings.arguments;
    //print("data:$user");
    await Future.delayed(Duration(seconds: 2));
    setState(ViewState.Idle);
  }

}