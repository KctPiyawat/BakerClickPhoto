// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

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
  final String WEIGHTREAL;
  final String DOCFLAG;
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
    required this.WEIGHTREAL,
    required this.DOCFLAG,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
      'WEIGHTREAL': WEIGHTREAL,
      'DOCFLAG': DOCFLAG,
    };
  }

  factory ShopeeDocnoModel.fromMap(Map<String, dynamic> map) {
    return ShopeeDocnoModel(
      NO: map['NO'] as String,
      DOCNO: map['DOCNO'] as String,
      DOCDATE: map['DOCDATE'] as String,
      CUSNAME: map['CUSNAME'] as String,
      CUSADDRESS: map['CUSADDRESS'] as String,
      DELIVERYVALUE: map['DELIVERYVALUE'] as String,
      PRODUCTCODE: map['PRODUCTCODE'] as String,
      BARCODE: map['BARCODE'] as String,
      PRODUCTNAME: map['PRODUCTNAME'] as String,
      UNITPRICE: map['UNITPRICE'] as String,
      QTY: map['QTY'] as String,
      UNITNAME: map['UNITNAME'] as String,
      NETAMOUNT: map['NETAMOUNT'] as String,
      SUMAMOUNT1: map['SUMAMOUNT1'] as String,
      FEEVALUE: map['FEEVALUE'] as String,
      DEBTAMOUNT: map['DEBTAMOUNT'] as String,
      WEIGHTALL: map['WEIGHTALL'] as String,
      PIC1: map['PIC1'] as String,
      REMARK: map['REMARK'] as String,
      CUSTREMARK: map['CUSTREMARK'] as String,
      STOCKBAL: map['STOCKBAL'] as String,
      PHONE: map['PHONE'] as String,
      CUSTSHOPEECODE: map['CUSTSHOPEECODE'] as String,
      WEIGHTTOT: map['WEIGHTTOT'] as String,
      PACKIMG1: map['PACKIMG1'] as String,
      PACKIMG2: map['PACKIMG2'] as String,
      PACKIMG3: map['PACKIMG3'] as String,
      PACKIMG4: map['PACKIMG4'] as String,
      WEIGHTREAL: map['WEIGHTREAL'] as String,
      DOCFLAG: map['DOCFLAG'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopeeDocnoModel.fromJson(String source) => ShopeeDocnoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShopeeDocnoModel(NO: $NO, DOCNO: $DOCNO, DOCDATE: $DOCDATE, CUSNAME: $CUSNAME, CUSADDRESS: $CUSADDRESS, DELIVERYVALUE: $DELIVERYVALUE, PRODUCTCODE: $PRODUCTCODE, BARCODE: $BARCODE, PRODUCTNAME: $PRODUCTNAME, UNITPRICE: $UNITPRICE, QTY: $QTY, UNITNAME: $UNITNAME, NETAMOUNT: $NETAMOUNT, SUMAMOUNT1: $SUMAMOUNT1, FEEVALUE: $FEEVALUE, DEBTAMOUNT: $DEBTAMOUNT, WEIGHTALL: $WEIGHTALL, PIC1: $PIC1, REMARK: $REMARK, CUSTREMARK: $CUSTREMARK, STOCKBAL: $STOCKBAL, PHONE: $PHONE, CUSTSHOPEECODE: $CUSTSHOPEECODE, WEIGHTTOT: $WEIGHTTOT, PACKIMG1: $PACKIMG1, PACKIMG2: $PACKIMG2, PACKIMG3: $PACKIMG3, PACKIMG4: $PACKIMG4, WEIGHTREAL: $WEIGHTREAL, DOCFLAG: $DOCFLAG)';
  }
}


