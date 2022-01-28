import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:flutter/material.dart';

class AlertContent extends StatelessWidget {
  final String currentPackimg;
  const AlertContent({
    Key? key,
    required this.currentPackimg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return currentPackimg.isEmpty
        ? SizedBox()
        : Image.network('${MyConstant.domainImage}$currentPackimg');
  }
}
