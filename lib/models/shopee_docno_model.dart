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
  });

  ShopeeDocnoModel copyWith({
    String? NO,
    String? DOCNO,
    String? DOCDATE,
    String? CUSNAME,
    String? CUSADDRESS,
    String? DELIVERYVALUE,
    String? PRODUCTCODE,
    String? BARCODE,
    String? PRODUCTNAME,
    String? UNITPRICE,
    String? QTY,
    String? UNITNAME,
    String? NETAMOUNT,
    String? SUMAMOUNT1,
    String? FEEVALUE,
    String? DEBTAMOUNT,
    String? WEIGHTALL,
    String? PIC1,
    String? REMARK,
    String? CUSTREMARK,
    String? STOCKBAL,
    String? PHONE,
    String? CUSTSHOPEECODE,
    String? WEIGHTTOT,
  }) {
    return ShopeeDocnoModel(
      NO: NO ?? this.NO,
      DOCNO: DOCNO ?? this.DOCNO,
      DOCDATE: DOCDATE ?? this.DOCDATE,
      CUSNAME: CUSNAME ?? this.CUSNAME,
      CUSADDRESS: CUSADDRESS ?? this.CUSADDRESS,
      DELIVERYVALUE: DELIVERYVALUE ?? this.DELIVERYVALUE,
      PRODUCTCODE: PRODUCTCODE ?? this.PRODUCTCODE,
      BARCODE: BARCODE ?? this.BARCODE,
      PRODUCTNAME: PRODUCTNAME ?? this.PRODUCTNAME,
      UNITPRICE: UNITPRICE ?? this.UNITPRICE,
      QTY: QTY ?? this.QTY,
      UNITNAME: UNITNAME ?? this.UNITNAME,
      NETAMOUNT: NETAMOUNT ?? this.NETAMOUNT,
      SUMAMOUNT1: SUMAMOUNT1 ?? this.SUMAMOUNT1,
      FEEVALUE: FEEVALUE ?? this.FEEVALUE,
      DEBTAMOUNT: DEBTAMOUNT ?? this.DEBTAMOUNT,
      WEIGHTALL: WEIGHTALL ?? this.WEIGHTALL,
      PIC1: PIC1 ?? this.PIC1,
      REMARK: REMARK ?? this.REMARK,
      CUSTREMARK: CUSTREMARK ?? this.CUSTREMARK,
      STOCKBAL: STOCKBAL ?? this.STOCKBAL,
      PHONE: PHONE ?? this.PHONE,
      CUSTSHOPEECODE: CUSTSHOPEECODE ?? this.CUSTSHOPEECODE,
      WEIGHTTOT: WEIGHTTOT ?? this.WEIGHTTOT,
    );
  }

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
    };
  }

  factory ShopeeDocnoModel.fromMap(Map<String, dynamic> map) {
    return ShopeeDocnoModel(
      NO: map['NO'],
      DOCNO: map['DOCNO'],
      DOCDATE: map['DOCDATE'],
      CUSNAME: map['CUSNAME'],
      CUSADDRESS: map['CUSADDRESS'],
      DELIVERYVALUE: map['DELIVERYVALUE'],
      PRODUCTCODE: map['PRODUCTCODE'],
      BARCODE: map['BARCODE'],
      PRODUCTNAME: map['PRODUCTNAME'],
      UNITPRICE: map['UNITPRICE'],
      QTY: map['QTY'],
      UNITNAME: map['UNITNAME'],
      NETAMOUNT: map['NETAMOUNT'],
      SUMAMOUNT1: map['SUMAMOUNT1'],
      FEEVALUE: map['FEEVALUE'],
      DEBTAMOUNT: map['DEBTAMOUNT'],
      WEIGHTALL: map['WEIGHTALL'],
      PIC1: map['PIC1'],
      REMARK: map['REMARK'],
      CUSTREMARK: map['CUSTREMARK'],
      STOCKBAL: map['STOCKBAL'],
      PHONE: map['PHONE'],
      CUSTSHOPEECODE: map['CUSTSHOPEECODE'],
      WEIGHTTOT: map['WEIGHTTOT'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopeeDocnoModel.fromJson(String source) => ShopeeDocnoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShopeeDocnoModel(NO: $NO, DOCNO: $DOCNO, DOCDATE: $DOCDATE, CUSNAME: $CUSNAME, CUSADDRESS: $CUSADDRESS, DELIVERYVALUE: $DELIVERYVALUE, PRODUCTCODE: $PRODUCTCODE, BARCODE: $BARCODE, PRODUCTNAME: $PRODUCTNAME, UNITPRICE: $UNITPRICE, QTY: $QTY, UNITNAME: $UNITNAME, NETAMOUNT: $NETAMOUNT, SUMAMOUNT1: $SUMAMOUNT1, FEEVALUE: $FEEVALUE, DEBTAMOUNT: $DEBTAMOUNT, WEIGHTALL: $WEIGHTALL, PIC1: $PIC1, REMARK: $REMARK, CUSTREMARK: $CUSTREMARK, STOCKBAL: $STOCKBAL, PHONE: $PHONE, CUSTSHOPEECODE: $CUSTSHOPEECODE, WEIGHTTOT: $WEIGHTTOT)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShopeeDocnoModel &&
      other.NO == NO &&
      other.DOCNO == DOCNO &&
      other.DOCDATE == DOCDATE &&
      other.CUSNAME == CUSNAME &&
      other.CUSADDRESS == CUSADDRESS &&
      other.DELIVERYVALUE == DELIVERYVALUE &&
      other.PRODUCTCODE == PRODUCTCODE &&
      other.BARCODE == BARCODE &&
      other.PRODUCTNAME == PRODUCTNAME &&
      other.UNITPRICE == UNITPRICE &&
      other.QTY == QTY &&
      other.UNITNAME == UNITNAME &&
      other.NETAMOUNT == NETAMOUNT &&
      other.SUMAMOUNT1 == SUMAMOUNT1 &&
      other.FEEVALUE == FEEVALUE &&
      other.DEBTAMOUNT == DEBTAMOUNT &&
      other.WEIGHTALL == WEIGHTALL &&
      other.PIC1 == PIC1 &&
      other.REMARK == REMARK &&
      other.CUSTREMARK == CUSTREMARK &&
      other.STOCKBAL == STOCKBAL &&
      other.PHONE == PHONE &&
      other.CUSTSHOPEECODE == CUSTSHOPEECODE &&
      other.WEIGHTTOT == WEIGHTTOT;
  }

  @override
  int get hashCode {
    return NO.hashCode ^
      DOCNO.hashCode ^
      DOCDATE.hashCode ^
      CUSNAME.hashCode ^
      CUSADDRESS.hashCode ^
      DELIVERYVALUE.hashCode ^
      PRODUCTCODE.hashCode ^
      BARCODE.hashCode ^
      PRODUCTNAME.hashCode ^
      UNITPRICE.hashCode ^
      QTY.hashCode ^
      UNITNAME.hashCode ^
      NETAMOUNT.hashCode ^
      SUMAMOUNT1.hashCode ^
      FEEVALUE.hashCode ^
      DEBTAMOUNT.hashCode ^
      WEIGHTALL.hashCode ^
      PIC1.hashCode ^
      REMARK.hashCode ^
      CUSTREMARK.hashCode ^
      STOCKBAL.hashCode ^
      PHONE.hashCode ^
      CUSTSHOPEECODE.hashCode ^
      WEIGHTTOT.hashCode;
  }
}
