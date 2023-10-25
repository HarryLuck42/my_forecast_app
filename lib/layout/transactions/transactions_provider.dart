
import 'package:my_forecast_app/core/base/base_provider.dart';
import 'package:my_forecast_app/model/transaction.dart';

class TransactionsProvider extends BaseProvider{
  List<Transition> _transactions = [];
  List<Transition> get trasactions => _transactions;
  set transactions(List<Transition> values){
    _transactions = values;
    notifyListeners();
  }
}