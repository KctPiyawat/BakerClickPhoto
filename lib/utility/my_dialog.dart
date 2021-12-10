import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:bakerclickphoto/widgets/show_image.dart';
import 'package:bakerclickphoto/widgets/show_title.dart';
import 'package:flutter/material.dart';

class MyDialog {
  Future<Null> normalDialog(BuildContext context,
      {required String title, required String message}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(
            path: MyConstant.image1,
          ),
          title: ShowTitle(title: title),
        ),
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
