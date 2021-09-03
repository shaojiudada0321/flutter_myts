// @dart=2.9
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_myts/net/api.dart';

import 'base_view_model.dart';

class LoginViewModel extends BaseModel {

  LoginViewModel({@required Api api}) : super(api: api);

  Timer _timer;
  int _countdownTime = 0;

  Future<void> sendSms(String mobile) async {
    await api.sensSms(mobile);
  }

  Future<bool> login(String mobile, String sms) async {
    return await api.login1(mobile, sms) != null;
  }

  void startCountdown() {
    _countdownTime = 60;
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        countdownTime--;
        if (countdownTime == 0) {
          cancelTimer();
        }
      });
    }
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  int get countdownTime => _countdownTime;

  set countdownTime(int value) {
    _countdownTime = value;
    notifyListeners();
  }

}
