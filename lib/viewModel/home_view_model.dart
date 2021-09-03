import 'package:flutter/material.dart';
import 'package:flutter_myts/common/view_state.dart';
import 'package:flutter_myts/net/api.dart';

import 'base_view_model.dart';

class HomeViewModel extends BaseModel{

  HomeViewModel({Api api}) : super(api: api);

  var funcLists = [];

  Future<void> initData() async {

    print('加载首页数据...');
    setState(ViewState.Busy);

    funcLists.add({
      "name": "癌症风险早期筛选套餐,癌症风险早期筛选套餐",
      "desc": "癌症风险早期筛选套餐简介，癌症风险早期筛选套餐简介",
      "Price": 10000.00,
      "PreOrder": 1234,
      "image":"images/listimage.png"
    });
    funcLists.add({
      "name": "癌症风险早期筛选套餐",
      "desc": "癌症风险早期筛选套餐简介，癌症风险早期筛选套餐简介",
      "Price": 10000.00,
      "PreOrder": 1234,
      "image":"images/listimagetwo.png"
    });
    funcLists.add({
      "name": "癌症风险早期筛选套餐",
      "desc": "癌症风险早期筛选套餐简介，癌症风险早期筛选套餐简介",
      "Price": 10000.00,
      "PreOrder": 1234,
      "image":"images/listimagethree.png"
    });
    funcLists.add({
      "name": "癌症风险早期筛选套餐",
      "desc": "癌症风险早期筛选套餐简介，癌症风险早期筛选套餐简介",
      "Price": 10000.00,
      "PreOrder": 1234,
      "image":"images/listimage.png"
    });
    funcLists.add({
      "name": "癌症风险早期筛选套餐",
      "desc": "癌症风险早期筛选套餐简介，癌症风险早期筛选套餐简介。",
      "Price": 10000.00,
      "PreOrder": 1234,
      "image":"images/listimagetwo.png"
    });
    funcLists.add({
      "name": "癌症风险早期筛选套餐",
      "desc": "癌症风险早期筛选套餐简介，癌症风险早期筛选套餐简介",
      "Price": 10000.00,
      "PreOrder": 1234,
      "image":"images/listimagethree.png"
    });
    funcLists.add({
      "name": "癌症风险早期筛选套餐",
      "desc": "癌症风险早期筛选套餐简介，癌症风险早期筛选套餐简介",
      "Price": 10000.00,
      "PreOrder": 1234,
      "image":"images/listimage.png"
    });

    print(funcLists);

    await Future.delayed(Duration(seconds: 2));
    setState(ViewState.Idle);
    print('加载首页数据完成');
  }
}