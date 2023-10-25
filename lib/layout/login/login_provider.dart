import 'package:flutter/cupertino.dart';
import 'package:my_forecast_app/core/base/base_provider.dart';
import 'package:my_forecast_app/core/constraint/sp_keys.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/core/routing/routes.dart';

class LoginProvider extends BaseProvider{
  bool _showPassword = false;
  bool get showPassword => _showPassword;
  set showPassword(bool val){
    _showPassword = val;
    notifyListeners();
  }

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  void loginApp(){
    'loginApp ${emailCtrl.text}, ${passCtrl.text}'.logger();
    setLoading(true);
    Future.delayed(const Duration(seconds: 3), (){
      setLoading(false);
      sharedPre.writeStorage(SpKeys.apiToken, 'MyToken' );
      Future.delayed(const Duration(seconds: 1), (){
        routing.moveReplacement(Routes.dashboard);
      });
    });
  }
}