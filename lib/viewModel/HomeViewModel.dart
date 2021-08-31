import 'package:flutter/material.dart';
import 'package:flutter_myts/net/network.dart';
import 'package:rxdart/rxdart.dart';

import 'BaseViewModel.dart';

class HomeViewModel extends BaseViewModel{

  // ignore: close_sinks
  BehaviorSubject<String> _dataObservable = BehaviorSubject();

  Stream<String> get dataStream => _dataObservable.stream;

  @override
  void dispose() {
    _dataObservable.close();
  }

  @override
  void doInit(BuildContext context) {
    refreshData(context);
  }

  @override
  Future refreshData(BuildContext context) {
    //个人比较喜欢这样写，不然要写try catch来包裹代码，try catch不如这样写起来方便，不用一直定义变量
    return NetWork.query().then((String text) {
      _dataObservable.add(text);
    }).catchError((error) {
      _dataObservable.addError(error);
    });
  }
  
}