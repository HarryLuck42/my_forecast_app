import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_forecast_app/core/base/base_provider.dart';
import 'package:my_forecast_app/core/constraint/sp_keys.dart';
import 'package:my_forecast_app/core/routing/routes.dart';

class SplashProvider extends BaseProvider{

  void validationPage(BuildContext context) async {
    await helper.handleLocationPermission(context);
    final String? token = sharedPre.readStorage(SpKeys.apiToken);
    print('validation: $token');

    Future.delayed(const Duration(seconds: 3), (){
      final user = FirebaseAuth.instance.currentUser;
      if(user != null){
        routing.moveReplacement(Routes.home);
      }else{
        routing.moveReplacement(Routes.login);
      }

      // if(token != null){
      //   if(token.isNotEmpty){
      //     routing.moveReplacement(Routes.dashboard);
      //   }else{
      //     routing.moveReplacement(Routes.login);
      //   }
      // }else{
      //   routing.moveReplacement(Routes.login);
      // }
    });
  }
}