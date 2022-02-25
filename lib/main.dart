import 'dart:io';

import 'package:bakerclickphoto/states/photo_service.dart';
import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/photoService': (BuildContext context) => PhotoService()
};

String? firstState;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  firstState = MyConstant.routePhotoService;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: firstState,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
     return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
