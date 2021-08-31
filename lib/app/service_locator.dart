import 'package:flutter_myts/services/navigate_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = getIt();

void setupLocator(){
  //注册服务
  getIt.registerSingleton(NavigateService());
}