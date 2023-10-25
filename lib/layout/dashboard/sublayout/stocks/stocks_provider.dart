import 'package:my_forecast_app/core/base/base_provider.dart';

import '../../../../model/product.dart';

class StocksProvider extends BaseProvider{
  List<Product> _products = [];

  List<Product> get products => _products;

  set products(List<Product> values){
    _products = values;
    notifyListeners();
  }
}