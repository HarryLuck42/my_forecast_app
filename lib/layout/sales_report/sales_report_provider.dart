import 'package:my_forecast_app/core/base/base_provider.dart';

import '../../model/transaction.dart';

class SalesReportProvider extends BaseProvider{
  List<Transition> _transactions = [];
  List<Transition> get transactions => _transactions;
  set transactions(List<Transition> values){
    _transactions = values;
    notifyListeners();
  }
}