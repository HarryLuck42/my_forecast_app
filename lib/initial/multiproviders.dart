import 'package:my_forecast_app/initial/provider.dart';
import 'package:my_forecast_app/layout/dashboard/dashboard_provider.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/customer/customer_provider.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/purchase/purchase_provider.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/reports/reports_provider.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/sales/sales_provider.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/stocks/stocks_provider.dart';
import 'package:my_forecast_app/layout/forgot_password/forgot_password_provider.dart';
import 'package:my_forecast_app/layout/home/home_provider.dart';
import 'package:my_forecast_app/layout/login/login_provider.dart';
import 'package:my_forecast_app/layout/sales_report/sales_report_provider.dart';
import 'package:my_forecast_app/layout/transactions/transactions_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../layout/splash/splash_provider.dart';

class Multiproviders{
  static List<SingleChildWidget> inject({required AppProvider rootNotifier}) => [
    ChangeNotifierProvider.value(value: rootNotifier),
    ChangeNotifierProvider(create: (_) => SplashProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => DashboardProvider()),
    ChangeNotifierProvider(create: (_) => CustomerProvider()),
    ChangeNotifierProvider(create: (_) => PurchaseProvider()),
    ChangeNotifierProvider(create: (_) => ReportsProvider()),
    ChangeNotifierProvider(create: (_) => SalesProvider()),
    ChangeNotifierProvider(create: (_) => StocksProvider()),
    ChangeNotifierProvider(create: (_) => TransactionsProvider()),
    ChangeNotifierProvider(create: (_) => SalesReportProvider()),
    ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
  ];
}