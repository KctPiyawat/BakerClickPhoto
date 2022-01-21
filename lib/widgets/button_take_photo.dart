import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:bakerclickphoto/widgets/show_image.dart';
import 'package:flutter/material.dart';

class ButtonTakePhoto extends StatelessWidget {
  final String urlPathImage;
  final Function() tapFunc;
  const ButtonTakePhoto({
    Key? key,
    required this.urlPathImage,
    required this.tapFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunc,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        width: 48,
        height: 48,
        child: urlPathImage.isEmpty
            ? ShowImage(path: 'images/icon.png')
            : Image.network('${MyConstant.domainImage}$urlPathImage', fit: BoxFit.cover,),
      ),
    );
  }
}
