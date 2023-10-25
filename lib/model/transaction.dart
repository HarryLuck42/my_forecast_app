
import 'package:my_forecast_app/model/product.dart';

import 'add_to_cart_model.dart';

class Transition {
  late String customerName, customerPhone, customerType, invoiceNumber, purchaseDate;
  double? totalAmount;
  double? dueAmount;
  double? returnAmount;
  double? discountAmount;

  bool? isPaid;
  String? paymentType;
  List<AddToCartModel>? productList;

  Transition({
    required this.customerName,
    required this.customerType,
    required this.customerPhone,
    required this.invoiceNumber,
    required this.purchaseDate,
    this.dueAmount,
    this.totalAmount,
    this.returnAmount,
    this.discountAmount,
    this.isPaid,
    this.paymentType,
    this.productList,
  });

  Transition.fromJson(Map<dynamic, dynamic> json) {
    customerName = json['customerName'] as String;
    customerPhone = json['customerPhone'].toString();
    invoiceNumber = json['invoiceNumber'].toString();
    customerType = json['customerType'].toString();
    purchaseDate = json['purchaseDate'].toString();
    totalAmount = double.parse(json['totalAmount'].toString());
    discountAmount = double.parse(json['discountAmount'].toString());
    dueAmount = double.parse(json['dueAmount'].toString());
    returnAmount = double.parse(json['returnAmount'].toString());
    isPaid = json['isPaid'];
    paymentType = json['paymentType'].toString();
    if (json['productList'] != null) {
      productList = <AddToCartModel>[];
      json['productList'].forEach((v) {
        productList!.add(AddToCartModel.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'customerName': customerName,
    'customerPhone': customerPhone,
    'customerType': customerType,
    'invoiceNumber': invoiceNumber,
    'purchaseDate': purchaseDate,
    'discountAmount': discountAmount,
    'totalAmount': totalAmount,
    'dueAmount': dueAmount,
    'returnAmount': returnAmount,
    'isPaid': isPaid,
    'paymentType': paymentType,
    'productList': productList?.map((e) => e.toJson()).toList(),
  };
}

class PurchaseTransitionModel {
  late String customerName, customerPhone, customerType, invoiceNumber, purchaseDate;
  double? totalAmount;
  double? dueAmount;
  double? returnAmount;
  double? discountAmount;

  bool? isPaid;
  String? paymentType;
  List<Product>? productList;

  PurchaseTransitionModel({
    required this.customerName,
    required this.customerType,
    required this.customerPhone,
    required this.invoiceNumber,
    required this.purchaseDate,
    this.dueAmount,
    this.totalAmount,
    this.returnAmount,
    this.discountAmount,
    this.isPaid,
    this.paymentType,
    this.productList,
  });

  PurchaseTransitionModel.fromJson(Map<dynamic, dynamic> json) {
    customerName = json['customerName'] as String;
    customerPhone = json['customerPhone'].toString();
    invoiceNumber = json['invoiceNumber'].toString();
    customerType = json['customerType'].toString();
    purchaseDate = json['purchaseDate'].toString();
    totalAmount = double.parse(json['totalAmount'].toString());
    discountAmount = double.parse(json['discountAmount'].toString());
    dueAmount = double.parse(json['dueAmount'].toString());
    returnAmount = double.parse(json['returnAmount'].toString());
    isPaid = json['isPaid'];
    paymentType = json['paymentType'].toString();
    if (json['productList'] != null) {
      productList = <Product>[];
      json['productList'].forEach((v) {
        productList!.add(Product.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'customerName': customerName,
    'customerPhone': customerPhone,
    'customerType': customerType,
    'invoiceNumber': invoiceNumber,
    'purchaseDate': purchaseDate,
    'discountAmount': discountAmount,
    'totalAmount': totalAmount,
    'dueAmount': dueAmount,
    'returnAmount': returnAmount,
    'isPaid': isPaid,
    'paymentType': paymentType,
    'productList': productList?.map((e) => e.toJson()).toList(),
  };
}
