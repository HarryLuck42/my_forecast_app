import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/routing/routes.dart';
import 'package:my_forecast_app/layout/dashboard/dashboard_screen.dart';
import 'package:my_forecast_app/layout/add_contact/add_contact_screen.dart';
import 'package:my_forecast_app/layout/forgot_password/forgot_password_screen.dart';
import 'package:my_forecast_app/layout/home/home_screen.dart';
import 'package:my_forecast_app/layout/home/sublayout/forecast_detail_screen.dart';
import 'package:my_forecast_app/layout/login/login_screen.dart';
import 'package:my_forecast_app/layout/sales_report/sales_report_screen.dart';
import 'package:my_forecast_app/layout/splash/splash_screen.dart';
import 'package:my_forecast_app/layout/transactions/transactions_screen.dart';
import 'package:my_forecast_app/model/response/forecast_response.dart';

class RoutesActions{
  static List<Route<dynamic>> initialAction(_){
    return [MaterialPageRoute(builder: (_) => SplashScreen())];
  }

  static Route<dynamic> allActions(RouteSettings settings){
    switch(settings.name){
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.forecastDetail:
        return MaterialPageRoute(builder: (_) => ForecastDetailScreen(data: settings.arguments as Hour));
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.addContact:
        return MaterialPageRoute(builder: (_) => AddContactScreen());
      case Routes.transactions:
        return MaterialPageRoute(builder: (_) => TransactionsScreen());
      case Routes.salesReport:
        return MaterialPageRoute(builder: (_) => SalesReportScreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
    }
    return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}

