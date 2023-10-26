import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_forecast_app/core/base/base_provider.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/core/routing/routes.dart';

class LoginProvider extends BaseProvider{
  bool _showPassword = false;
  bool get showPassword => _showPassword;
  set showPassword(bool val){
    _showPassword = val;
    notifyListeners();
  }

  bool _isLogin = true;
  bool get isLogin => _isLogin;
  set isLogin(bool state){
    _isLogin = state;
    notifyListeners();
  }

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  void loginApp(BuildContext context){
    setLoading(true);
    FirebaseAuth.instance.signInWithEmailAndPassword(email: emailCtrl.text, password: passCtrl.text).then((value){
      setLoading(false);
      routing.moveReplacement(Routes.home);
    }).onError((error, stackTrace){
      setLoading(false);
      context.showShackBar(error.toString());
    });
  }

  void registerApp(BuildContext context){
    if(!emailCtrl.text.isEmail()){
      context.showShackBar('Mohon mengisi email yang valid');
    }else if(passCtrl.text.length <= 7){
      context.showShackBar('Mohon mengisi password lebih dari 8 karakter');
    }else{
      setLoading(true);
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailCtrl.text, password: passCtrl.text).then((value){
        setLoading(false);
        routing.moveReplacement(Routes.home);
      }).onError((error, stackTrace){
        setLoading(false);
        context.showShackBar(error.toString());
      });
    }
  }
}