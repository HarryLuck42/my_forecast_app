import 'package:flutter/cupertino.dart';
import 'package:my_forecast_app/core/base/base_provider.dart';

import '../../../../model/customer.dart';

class CustomerProvider extends BaseProvider{
  List<Customer> _customers = [];
  List<Customer> get customers => _customers;

  set customers (List<Customer> list){
    _customers = customers;
    notifyListeners();
  }

  TextEditingController searchCtrl = TextEditingController();
}