import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:flutter/material.dart';

class ShowTitle extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  const ShowTitle({Key? key, required this.title, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? myTextStyle = textStyle;
    if (myTextStyle == null) {
      myTextStyle = MyConstant().h3mornalStyle();
    }
    return Text(title,style: myTextStyle,);
  }
}
