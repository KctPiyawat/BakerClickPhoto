import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:bakerclickphoto/widgets/show_image.dart';
import 'package:bakerclickphoto/widgets/show_title.dart';
import 'package:flutter/material.dart';

class MyDialog {
  Future<Null> normalDialog(BuildContext context,
      {required String title,
      required String message,
      String? label,
      Function()? pressFunc}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(
            path: MyConstant.image1,
          ),
          title: ShowTitle(title: title),
          subtitle: ShowTitle(title: message),
        ),
        actions: [
          TextButton(
              onPressed: pressFunc ??
                  () {
                    Navigator.pop(context);
                  },
              child: ShowTitle(title: label ?? 'OK'))
        ],
      ),
    );
  }

  Future<Null> processDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => WillPopScope(
              child: Center(
                child: CircularProgressIndicator(
                  color: MyConstant.dark,
                  backgroundColor: MyConstant.light,
                ),
              ),
              onWillPop: () async {
                return false;
              },
            ));
  }
}
