import 'package:my_forecast_app/core/base/base_provider.dart';
import 'package:my_forecast_app/core/constraint/enum.dart';

class DashboardProvider extends BaseProvider{
  AppTab _currentTab = AppTab.reports;

  AppTab get currentTab => _currentTab;

  set currentTab(AppTab tab){
    _currentTab = tab;
    notifyListeners();
  }


}