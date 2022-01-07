import 'dart:io';
import 'package:bakerclickphoto/models/shopee_docno_model.dart';
import 'package:bakerclickphoto/utility/my_constant.dart';
import 'package:bakerclickphoto/utility/my_dialog.dart';
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
  List<ShopeeDocnoModel> shopeeDocnoModels = [];
  List<Widget> widgets = [];
  bool displayDetailCustomer = false;
  List<Color> colors = [Colors.grey.shade200, Colors.grey.shade50];
  int countColor = 0;

  List<File?> files = [];
  File? file;

  var listImages = [false, false, false, false];

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
    textEditingController.text = '2105109TRN8CH5';

    setUpFiles();
  }

  void setUpFiles() {
    if (files.isNotEmpty) {
      files.clear();
    }

    for (var i = 0; i < 4; i++) {
      files.add(null);
    }
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
          buildRow(
              'รหัสลูกค้า : ',
              shopeeDocnoModels.length == 0
                  ? ''
                  : shopeeDocnoModels[0].CUSTSHOPEECODE),
          buildRow('เลขที่สั่งซื้อ : ',
              shopeeDocnoModels.length == 0 ? '' : shopeeDocnoModels[0].DOCNO),
          buildRow(
              'ชื่อ :',
              shopeeDocnoModels.length == 0
                  ? ''
                  : shopeeDocnoModels[0].CUSNAME),
          buildRow(
              'ที่อยู่ : ',
              shopeeDocnoModels.length == 0
                  ? ''
                  : shopeeDocnoModels[0].CUSADDRESS),
          buildRow('เบอร์โทร : ',
              shopeeDocnoModels.length == 0 ? '' : shopeeDocnoModels[0].PHONE),
          // buildHeadTitle('รายการสั่งซื้อ'),
          buildListOrder(),
          buildHeadTitle('รูปถ่าย Package'),
          controlImage(),
          buildRow(
              'น้ำหนักสินค้า : ',
              shopeeDocnoModels.length == 0
                  ? ''
                  : '  ${shopeeDocnoModels[0].WEIGHTTOT} kg'),
        ],
      ),
    );
  }

  Padding controlImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildImage(0, shopeeDocnoModels[0].PACKIMG1),
          buildImage(1, shopeeDocnoModels[0].PACKIMG2),
          buildImage(2, shopeeDocnoModels[0].PACKIMG3),
          buildImage(3, shopeeDocnoModels[0].PACKIMG4),
        ],
      ),
    );
  }

  Future<Null> processTakePhoto(ImageSource source, int index) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source,
        maxHeight: 800,
        maxWidth: 800,
      );
      setState(() {
        files[index] = File(result!.path);
      });
    } catch (e) {}
  }

  Future<Null> imageDialog(int index, String packimg) async {
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
        content: files[index] == null
            ? packimg.isNotEmpty
                ? Image.network('${MyConstant.domainImage}$packimg')
                : SizedBox()
            : Stack(
                children: [
                  Image.file(files[index]!),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Card(
                      color: Colors.white.withOpacity(0.5),
                      child: IconButton(
                        onPressed: (){
                          processUploadImge(index);
                        },  // end Func
                        icon: Icon(
                          Icons.cloud_upload_outlined,
                          size: 36,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                ],
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

  Future<void> processUploadImge(int index) async {
                          MyDialog().processDialog(context);

                          String nameFile =
                              '${textEditingController.text}_${index + 1}.jpg';

                          try {
                            Map<String, dynamic> map = {};
                            map['file'] = await MultipartFile.fromFile(
                                files[index]!.path,
                                filename: nameFile);
                            FormData data = FormData.fromMap(map);

                            String urlAPi =
                                'http://210.86.171.110:89/webapi3/api/docfile';
                            await Dio()
                                .post(urlAPi, data: data)
                                .then((value) async {
                              print('@@ value ==> $value');
                              Navigator.pop(context);

                              // process UPdate Database
                              var key = [
                                'PACKIMG1',
                                'PACKIMG2',
                                'PACKIMG3',
                                'PACKIMG4'
                              ];

                              var picnums = <int>[
                                1,
                                2,
                                3,
                                4,
                              ];

                              Map<String, dynamic> map = {};
                              map[key[index]] = value.toString();
                              print(
                                  '@@ picnum ===> ${picnums[index]} map ====> $map');

                              String docno = textEditingController.text;
                              int picnum = picnums[index];
                              String picname = nameFile;

                              String apiUpdateImgePackage =
                                  'http://210.86.171.110:89/webapi3/api/shopeepic?docno=$docno&picnum=$picnum&picname=$picname';

                              await Dio()
                                  .get(apiUpdateImgePackage)
                                  .then((value) {
                                print('@@ Success Update Image $picnum');
                                processSearch(docno);
                              });
                            });
                          } catch (e) {
                            print('@@ error =>$e');
                            Navigator.pop(context);
                            MyDialog().normalDialog(context,
                                title: 'Have Problem',
                                message: 'Wait few minus Please again');
                          }
                        }

  Container buildImage(int index, String packimg) {
    print('@@ image$index ====> $packimg');
    return Container(
      width: 48,
      height: 48,
      child: GestureDetector(
        onTap: () {
          print('#### Click index =>$index');
          imageDialog(index, packimg);
        },
        child: packimg.isNotEmpty
            ? Image.network(
                '${MyConstant.domainImage}$packimg',
                fit: BoxFit.cover,
              )
            : files[index] == null
                ? ShowImage(path: MyConstant.icon)
                : Image.file(
                    files[index]!,
                    fit: BoxFit.cover,
                  ),
      ),
    );
  }

  Widget buildListOrder() {
    return SingleChildScrollView(
      child: ExpansionTile(
        title: ShowTitle(
          title: 'รายการสั่งซื้อ',
          textStyle: MyConstant().h2BuleStyle(),
        ),
        children: widgets,
      ),
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

  Row buildRow(String head, String value) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ShowTitle(title: head),
        ),
        Expanded(
          flex: 3,
          child: ShowTitle(title: value),
        ),
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
    setUpFiles();

    if (shopeeDocnoModels.length != 0) {
      shopeeDocnoModels.clear();
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
          ShopeeDocnoModel model = ShopeeDocnoModel.fromMap(map);
          print('##### idCus ===>> ${model.CUSTSHOPEECODE}');
          setState(() {
            displayDetailCustomer = true;
            shopeeDocnoModels.add(model);
            widgets.add(createWidget(model, countColor % 2));
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
}
