import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost_app.dart';
import 'HomePage.dart';
import 'dart:convert' as convert;


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
   static Map<String, FlutterBoostRouteFactory>
	   routerMap = {
    '/': (settings, uniqueId) {
      var paramTmp = settings.arguments;
      Map<String,dynamic> arguments = new Map<String,dynamic>.from(paramTmp);
      String paramTmpStr = arguments['params'];
      Map<String,dynamic> parmas = convert.jsonDecode(paramTmpStr);
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___)
          => MyHomePage(title: parmas['title'] ?? '...',));
    },
    'MyHomePage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) =>
          MyHomePage());
    }};

    
   Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {
    FlutterBoostRouteFactory func =routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory
    );
  }

}
