import 'dart:io';
import 'package:bakerclickphoto/models/shopee_docno_model.dart';
import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:bakerclickphoto/utility/my_dialog.dart';
import 'package:bakerclickphoto/widgets/alert_content.dart';
import 'package:bakerclickphoto/widgets/button_take_photo.dart';
import 'package:bakerclickphoto/widgets/show_image.dart';
import 'package:bakerclickphoto/widgets/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart';

class PhotoService extends StatefulWidget {
  const PhotoService({Key? key}) : super(key: key);

  @override
  _PhotoServiceState createState() => _PhotoServiceState();
}

class _PhotoServiceState extends State<PhotoService> {
  TextEditingController textEditingController = TextEditingController();
  // List<ShopeeDocnoModel> shopeeDocnoModels = [];
  List<Widget> widgets = [];
  bool displayDetailCustomer = false;
  List<Color> colors = [Colors.grey.shade200, Colors.grey.shade50];
  int countColor = 0;

  List<File?> files = [];
  File? file;

  var listImages = [false, false, false, false];

  String? totalWeight;

  ShopeeDocnoModel? shopeeDocnoModel;

  Future<Null> processScan() async {
    try {
      var result = await scan();
      print('####################### result = $result');
      textEditingController.text = result.toString();
      processSearch(result.toString());
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.text = '105109TRN8CH5';
    textEditingController.text = '220505CNYRP2GQ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppName(),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildSearch(constraints),
                displayDetailCustomer
                    ? showDetailCustomer(constraints)
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppName() {
    return AppBar(
      backgroundColor: MyConstant.primary,
      title: Text(MyConstant.appName),
      actions: [
        IconButton(
          onPressed: () => checkCamera(),
          icon: Icon(Icons.qr_code),
        ),
      ],
    );
  }

  Container showDetailCustomer(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.9,
      child: Column(
        children: [
          buildHeadTitle('รายละเอียดลูกค้า'),
          buildRow('Date', cutWorddate(shopeeDocnoModel!.DOCDATE)),

          buildRow('รหัสลูกค้า : ',
              shopeeDocnoModel == null ? '' : shopeeDocnoModel!.CUSTSHOPEECODE),
          buildRow('เลขที่สั่งซื้อ : ',
              shopeeDocnoModel == null ? '' : shopeeDocnoModel!.DOCNO),
          buildRow('ชื่อ :',
              shopeeDocnoModel == null ? '' : shopeeDocnoModel!.CUSNAME),
          buildRow('ที่อยู่ : ',
              shopeeDocnoModel == null ? '' : shopeeDocnoModel!.CUSADDRESS),
          buildRow('เบอร์โทร : ',
              shopeeDocnoModel == null ? '' : shopeeDocnoModel!.PHONE),
          // buildHeadTitle('รายการสั่งซื้อ'),
          buildListOrder(),
          buildListPhoto(),

          buildHeadTitle('น้ำหนัก : '),
          buildRow(
              'น้ำหนักสินค้าสินค้ารวม : ', '${shopeeDocnoModel!.WEIGHTTOT} kg',
              spFlex: 3),
          buildRow(
            'น้ำหนักสินค้ารวมแพ็ค : ',
            '${shopeeDocnoModel!.WEIGHTREAL} kg',
            spFlex: 3,
            pressBol: true,
            pressFunc: () {
              int docFlagInt = int.parse(shopeeDocnoModel!.DOCFLAG.trim());
              switch (docFlagInt) {
                case 0:
                  print('process Edit Weight');
                  processEditWeight(
                      currentWeight: shopeeDocnoModel!.WEIGHTREAL);
                  break;
                case 1:
                  MyDialog().normalDialog(context,
                      title: 'ไม่สามารถแก้ไขได้ ?',
                      message: 'เอกสารอ้างอิง ทำใบขายแล้ว');
                  break;
                case 2:
                  MyDialog().normalDialog(context,
                      title: 'ไม่สามารถแก้ไขได้ ?',
                      message: 'เอกสารยกเลิกแล้ว');
                  break;
                default:
              }
            },
          ),
        ],
      ),
    );
  }

  ExpansionTile buildListPhoto() => ExpansionTile(
        title: buildHeadTitle('รูปถ่าย Package : '),
        children: [
          newControlImage(),
        ],
      );

  Widget newControlImage() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonTakePhoto(
            tapFunc: () {
              print('You Click1');
              imageDialog(0, '${textEditingController.text}_1',
                  shopeeDocnoModel!.PACKIMG1);
            },
            urlPathImage: shopeeDocnoModel!.PACKIMG1,
          ),
          ButtonTakePhoto(
            tapFunc: () {
              print('You Click2');
              imageDialog(1, '${textEditingController.text}_2',
                  shopeeDocnoModel!.PACKIMG2);
            },
            urlPathImage: shopeeDocnoModel!.PACKIMG2,
          ),
          ButtonTakePhoto(
            tapFunc: () {
              print('You Click3');
              imageDialog(2, '${textEditingController.text}_3',
                  shopeeDocnoModel!.PACKIMG3);
            },
            urlPathImage: shopeeDocnoModel!.PACKIMG3,
          ),
          ButtonTakePhoto(
            tapFunc: () {
              print('You Click4');
              imageDialog(3, '${textEditingController.text}_4',
                  shopeeDocnoModel!.PACKIMG4);
            },
            urlPathImage: shopeeDocnoModel!.PACKIMG4,
          ),
        ],
      );

  Future<Null> processTakePhoto(ImageSource source, int index) async {
    try {
      print('Form Imge index ===> $index');

      var result = await ImagePicker().pickImage(
        source: source,
        maxHeight: 800,
        maxWidth: 800,
      );

      File file = File(result!.path);

      processUploadImge(index, file);
    } catch (e) {}
  }

  Future<Null> imageDialog(
      int index, String packimg, String currentPackimg) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.icon),
          title: ShowTitle(
            title: 'รูปภาพที่ ${index + 1}',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(title: 'กรุณา เลือกแหล่งกำเหนิดภาพ ด้วยคะ'),
        ),
        content: AlertContent(
          currentPackimg: currentPackimg,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  processTakePhoto(ImageSource.camera, index);
                },
                child: Text('ถ่ายรูป'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  processTakePhoto(ImageSource.gallery, index);
                },
                child: Text('รูปในเครื่อง'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ยกเลิก'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> processUploadImge(int index, File file) async {
    MyDialog().processDialog(context);

    String nameFile = '${textEditingController.text}_${index + 1}.jpg';

    try {
      Map<String, dynamic> map = {};
      map['file'] = await MultipartFile.fromFile(file.path, filename: nameFile);
      FormData data = FormData.fromMap(map);

      String urlAPi = 'http://210.86.171.110:89/webapi3/api/docfile';
      await Dio().post(urlAPi, data: data).then((value) async {
        print('@@ value ==> $value');
        Navigator.pop(context);

        // process UPdate Database
        var key = ['PACKIMG1', 'PACKIMG2', 'PACKIMG3', 'PACKIMG4'];

        var picnums = <int>[
          1,
          2,
          3,
          4,
        ];

        Map<String, dynamic> map = {};
        map[key[index]] = value.toString();
        print('@@ picnum ===> ${picnums[index]} map ====> $map');

        String docno = textEditingController.text;
        int picnum = picnums[index];
        String picname = nameFile;

        String apiUpdateImgePackage =
            'http://210.86.171.110:89/webapi3/api/shopeepic?docno=$docno&picnum=$picnum&picname=$picname';

        await Dio().get(apiUpdateImgePackage).then((value) {
          print('@@ Success Update Image $picnum');
          setState(() {
            processSearch(docno);
          });
        });
      });
    } catch (e) {
      print('@@ error =>$e');
      Navigator.pop(context);
      MyDialog().normalDialog(context,
          title: 'Have Problem', message: 'Wait few minus Please again');
    }
  }

  Widget buildListOrder() {
    return ExpansionTile(
      title: buildHeadTitle('รายการสั่งซื้อ : '),
      children: widgets,
    );
  }

  Row buildHeadTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ShowTitle(
            title: title,
            textStyle: MyConstant().h2BuleStyle(),
          ),
        ),
      ],
    );
  }

  Row buildRow(String head, String value,
      {int? spFlex, bool? pressBol, Function()? pressFunc}) {
    bool status = pressBol ?? false;
    return Row(
      children: [
        Expanded(
          // flex: spFelx == null ? 1 : spFlex,
          flex: spFlex ?? 1,
          child: ShowTitle(title: head),
        ),
        Expanded(
          flex: status ? 2 : 3,
          child: ShowTitle(title: value),
        ),
        status
            ? Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: pressFunc,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: MyConstant.dark,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Future<Null> checkCamera() async {
    await Permission.camera.status.then((value) async {
      print('cameraStatas ===> $value');
      if (value.isDenied) {
        await Permission.camera
            .request()
            .then((value) => print('value after permission Camer ===> $value'));
      } else {
        processScan();
      }
    });
  }

  Future<Null> processSearch(String search) async {
    if (shopeeDocnoModel != null) {
      shopeeDocnoModel = null;
      displayDetailCustomer = false;
      widgets.clear();
    }

    // print('### search ==> $search');
    MyDialog().processDialog(context);

    String apiSearch =
        'http://210.86.171.110:89/webapi3/api/shopeedoc?docno=$search';
    await Dio().get(apiSearch).then((value) {
      // print('##### value === $value');
      Navigator.pop(context);
      if (value.toString() == '[]') {
        print('No Data');
        MyDialog()
            .normalDialog(context, title: 'Code False ?', message: 'ไม่มี');
      } else {
        for (var map in value.data) {
          shopeeDocnoModel = ShopeeDocnoModel.fromMap(map);

          setState(() {
            displayDetailCustomer = true;
            widgets.add(createWidget(shopeeDocnoModel!, countColor % 2));
          });
          countColor++;
        }
      }
    });
  }

  Widget createWidget(ShopeeDocnoModel model, int index) {
    return Card(
      color: colors[index],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 330,
                  child: ShowTitle(
                    title: model.PRODUCTNAME,
                    textStyle: MyConstant().h3Style(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShowTitle(
                  title: model.BARCODE,
                  textStyle: MyConstant().h3PrimaryStyle(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShowTitle(title: formatQTY(model.QTY)),
                    SizedBox(
                      width: 4,
                    ),
                    ShowTitle(title: model.UNITNAME),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatQTY(String qty) {
    String result;
    List<String> strings = qty.split('.');
    if (strings[0] == null) {
      result = qty;
    } else {
      result = strings[0];
    }
    return result;
  }

  Widget buildSearch(BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              width: constraints.maxWidth * 0.6,
              height: 40,
              child: TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'หมายเลขสั่งซื้อ',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  border: OutlineInputBorder(),
                ),
              )),
          ElevatedButton(
            onPressed: () {
              String search = textEditingController.text.trim();
              if (search.isNotEmpty) {
                processSearch(search);
              } else {
                print('### search Empty');
                MyDialog().normalDialog(context,
                    title: 'ไม่มีหมายเลขสั่งซื้อ',
                    message: 'กรุณากรอก หรือ สแกนบาร์โค้ด หมายเลขสั่งซื้อ');
              }
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }

  String cutWorddate(String docdate) {
    var strings = docdate.split(' ');
    return strings[0];
  }

  Future<void> processEditWeight({required String currentWeight}) async {
    TextEditingController controller = TextEditingController();
    if (currentWeight != '0.00') {
      controller.text = currentWeight;
    }

    weightDialog(controller, currentWeight);
  }

  Future<dynamic> weightDialog(TextEditingController controller, String currentWeight) {
    return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: ListTile(
        leading: ShowImage(path: 'images/image2.png'),
        title: ShowTitle(
          title: 'น้ำหนักรวมแพ็ค',
          textStyle: MyConstant().h2BuleStyle(),
        ),
        subtitle: ShowTitle(title: 'กรุณาใส่น้ำหนักเป็นหน่วย กิโลกรัม'),
      ),
      content: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: ShowTitle(title: 'น้ำหนักรวมแพ็ค'),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.dark, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyConstant.light)),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);

            totalWeight = controller.text;

            if (totalWeight?.isEmpty ?? true) {
              MyDialog().normalDialog(
                context,
                title: 'ยังไม่ได้กรอกน้ำหนัก',
                message: 'กรุณากรอกน้ำหนัก',
                label: 'กรอกน้ำหนัก',
                pressFunc: () {
                  Navigator.pop(context);
                  processEditWeight(currentWeight: currentWeight);

                },
              );
            }
          },
          child: ShowTitle(
            title: 'Save',
            textStyle: MyConstant().h3mornalButtonStyle(),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: ShowTitle(
            title: 'Cancel',
            textStyle: MyConstant().h3mornalButtonStyle(),
          ),
        ),
      ],
    ),
  );
  }
}
