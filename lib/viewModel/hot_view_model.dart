import 'package:flutter/material.dart';
import 'package:flutter_myts/app/Application.dart';
import 'package:flutter_myts/common/view_state.dart';
import 'package:flutter_myts/model/user.dart';
import 'package:flutter_myts/net/api.dart';
import 'package:flutter_myts/ui/product/hot_product_info.dart';
import 'package:flutter_myts/utils/utils.dart';
import 'package:flutter_myts/viewModel/base_view_model.dart';

import '../main.dart';


class HotViewModel extends BaseModel{

  HotViewModel({Api api}) : super(api: api);

  var funcLists = [];

  //Future:异步
  Future<void> initData() async {

    print('加载首页数据...');
    setState(ViewState.Busy);

    funcLists.add({
      "name": "癌症风险早期筛选套餐（公测版)",
      "desc": null,
      "Price": 1100.00,
      "PreOrder": 138,
      "image":"images/hotlistone.png"
    });
    funcLists.add({
      "name": "幽门螺杆菌分型检测",
      "desc": "可区分是否强毒性感染，避免滥用抗生素治疗",
      "Price": 280.00,
      "PreOrder": 19,
      "image":"images/hotlisttwo.png"
    });

    print(funcLists);

    await Future.delayed(Duration(seconds: 1));
    setState(ViewState.Idle);
    print('加载首页数据完成');
  }

  //跳转到产品详情页
  jump_Product()=> {
    //jump_page('hot_product_info',User(25, "xuchaodong"))
    //Navigator.of(Application.getContext()).pushNamed('hot_product_info', arguments: User(25, "xuchaodong"))
    Navigator.of(Application.getContext()).push(
      MaterialPageRoute(
      builder: (context) => ProductWidget(),
      settings: RouteSettings(
      arguments: User(25, "xuchaodong"),
      )
      ),
    )
  };

}