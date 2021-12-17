import 'dart:convert';

class ShopeeDocnoModel {
  final String NO;
  final String DOCNO;
  final String DOCDATE;
  final String CUSNAME;
  final String CUSADDRESS;
  final String DELIVERYVALUE;
  final String PRODUCTCODE;
  final String BARCODE;
  final String PRODUCTNAME;
  final String UNITPRICE;
  final String QTY;
  final String UNITNAME;
  final String NETAMOUNT;
  final String SUMAMOUNT1;
  final String FEEVALUE;
  final String DEBTAMOUNT;
  final String WEIGHTALL;
  final String PIC1;
  final String REMARK;
  final String CUSTREMARK;
  final String STOCKBAL;
  final String PHONE;
  final String CUSTSHOPEECODE;
  final String WEIGHTTOT;
  final String PACKIMG1;
  final String PACKIMG2;
  final String PACKIMG3;
  final String PACKIMG4;
  ShopeeDocnoModel({
    required this.NO,
    required this.DOCNO,
    required this.DOCDATE,
    required this.CUSNAME,
    required this.CUSADDRESS,
    required this.DELIVERYVALUE,
    required this.PRODUCTCODE,
    required this.BARCODE,
    required this.PRODUCTNAME,
    required this.UNITPRICE,
    required this.QTY,
    required this.UNITNAME,
    required this.NETAMOUNT,
    required this.SUMAMOUNT1,
    required this.FEEVALUE,
    required this.DEBTAMOUNT,
    required this.WEIGHTALL,
    required this.PIC1,
    required this.REMARK,
    required this.CUSTREMARK,
    required this.STOCKBAL,
    required this.PHONE,
    required this.CUSTSHOPEECODE,
    required this.WEIGHTTOT,
    required this.PACKIMG1,
    required this.PACKIMG2,
    required this.PACKIMG3,
    required this.PACKIMG4,
  });


  Map<String, dynamic> toMap() {
    return {
      'NO': NO,
      'DOCNO': DOCNO,
      'DOCDATE': DOCDATE,
      'CUSNAME': CUSNAME,
      'CUSADDRESS': CUSADDRESS,
      'DELIVERYVALUE': DELIVERYVALUE,
      'PRODUCTCODE': PRODUCTCODE,
      'BARCODE': BARCODE,
      'PRODUCTNAME': PRODUCTNAME,
      'UNITPRICE': UNITPRICE,
      'QTY': QTY,
      'UNITNAME': UNITNAME,
      'NETAMOUNT': NETAMOUNT,
      'SUMAMOUNT1': SUMAMOUNT1,
      'FEEVALUE': FEEVALUE,
      'DEBTAMOUNT': DEBTAMOUNT,
      'WEIGHTALL': WEIGHTALL,
      'PIC1': PIC1,
      'REMARK': REMARK,
      'CUSTREMARK': CUSTREMARK,
      'STOCKBAL': STOCKBAL,
      'PHONE': PHONE,
      'CUSTSHOPEECODE': CUSTSHOPEECODE,
      'WEIGHTTOT': WEIGHTTOT,
      'PACKIMG1': PACKIMG1,
      'PACKIMG2': PACKIMG2,
      'PACKIMG3': PACKIMG3,
      'PACKIMG4': PACKIMG4,
    };
  }

  factory ShopeeDocnoModel.fromMap(Map<String, dynamic> map) {
    return ShopeeDocnoModel(
      NO: map['NO'] ?? '',
      DOCNO: map['DOCNO'] ?? '',
      DOCDATE: map['DOCDATE'] ?? '',
      CUSNAME: map['CUSNAME'] ?? '',
      CUSADDRESS: map['CUSADDRESS'] ?? '',
      DELIVERYVALUE: map['DELIVERYVALUE'] ?? '',
      PRODUCTCODE: map['PRODUCTCODE'] ?? '',
      BARCODE: map['BARCODE'] ?? '',
      PRODUCTNAME: map['PRODUCTNAME'] ?? '',
      UNITPRICE: map['UNITPRICE'] ?? '',
      QTY: map['QTY'] ?? '',
      UNITNAME: map['UNITNAME'] ?? '',
      NETAMOUNT: map['NETAMOUNT'] ?? '',
      SUMAMOUNT1: map['SUMAMOUNT1'] ?? '',
      FEEVALUE: map['FEEVALUE'] ?? '',
      DEBTAMOUNT: map['DEBTAMOUNT'] ?? '',
      WEIGHTALL: map['WEIGHTALL'] ?? '',
      PIC1: map['PIC1'] ?? '',
      REMARK: map['REMARK'] ?? '',
      CUSTREMARK: map['CUSTREMARK'] ?? '',
      STOCKBAL: map['STOCKBAL'] ?? '',
      PHONE: map['PHONE'] ?? '',
      CUSTSHOPEECODE: map['CUSTSHOPEECODE'] ?? '',
      WEIGHTTOT: map['WEIGHTTOT'] ?? '',
      PACKIMG1: map['PACKIMG1'] ?? '',
      PACKIMG2: map['PACKIMG2'] ?? '',
      PACKIMG3: map['PACKIMG3'] ?? '',
      PACKIMG4: map['PACKIMG4'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopeeDocnoModel.fromJson(String source) => ShopeeDocnoModel.fromMap(json.decode(source));
}


