import 'package:bakerclickphoto/states/photo_service.dart';
import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/photoService': (BuildContext context) => PhotoService()
};

String? firstState;

void main(){
  firstState= MyConstant.routePhotoService;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: firstState,
    );
  }
}
