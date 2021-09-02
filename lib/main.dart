// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_myts/app/router.dart';
import 'package:fluwx/fluwx.dart';
import 'package:provider/provider.dart';
import 'app/provider_setup.dart';
import 'app/route_paths.dart';
void main() {
  runApp(MyApp());
  // runApp( MultiProvider(
  //   providers: [
  //     Provider(create: (_) => HomeViewModel())
  //   ],
  //   child: MyApp(),
  // ));
  //setupLocator();//容器初始化
  //Fluwx.registerApp(RegisterModel(appId: "your app id", doOnAndroid: true, doOnIOS: true));
  //registerWxApi(appId: "wx6f384dc444fe2ca4",universalLink: null);
  initWX();
}
void initWX() async{
  await registerWxApi(
      appId:"wx6f384dc444fe2ca4",
      doOnAndroid: true,
      doOnIOS: true,
      universalLink:null

  );
}
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RoutePaths.LOGIN,
        onGenerateRoute: MyRouter.generateRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: Text('Error'),
    );
  }
}
