import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/base/base_provider.dart';
import 'package:my_forecast_app/model/customer.dart';

import '../../../../model/product.dart';

class SalesProvider extends BaseProvider{
  List<Product> _products = [];

  List<Product> get products => _products;

  set products(List<Product> values){
    _products = values;
    notifyListeners();
  }

  List<Customer> _customers = [];

  List<Customer> get customers => _customers;

  set customers(List<Customer> values){
    _customers = values;
    notifyListeners();
  }

  String? _role = null;

  String? get role => _role;

  set role(String? val){
    _role = val;
    notifyListeners();
  }

  final searchCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  onDispose(){
    role = null;
    searchCtrl.clear();
    phoneCtrl.clear();
    nameCtrl.clear();
  }

  addCustomer(Customer customer){
    setLoading(true);
    Future.delayed(const Duration(seconds: 2), (){
      setLoading(false);
      _customers.add(customer);
      notifyListeners();
      onDispose();
      routing.moveBack();
    });
  }

}