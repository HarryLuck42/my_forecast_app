import 'package:flutter/cupertino.dart';
import 'package:my_forecast_app/core/base/base_provider.dart';

import '../../../../model/customer.dart';

class PurchaseProvider extends BaseProvider{
  List<Customer> _customers = [];

  List<Customer> get customers => _customers;

  set customers(List<Customer> values){
    _customers = customers;
    notifyListeners();
  }

  String _searchCustomer = '';

  String get searchCustomer => _searchCustomer;

  set searchCustomer(String val){
    _searchCustomer = val;
    notifyListeners();
  }

  TextEditingController searchCtrl = TextEditingController();
}