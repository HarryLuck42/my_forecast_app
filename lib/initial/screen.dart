import 'package:flutter/material.dart';
import 'package:my_forecast_app/app.dart';
import 'package:my_forecast_app/core/lifecycle/lifecycle_manager.dart';
import 'package:my_forecast_app/core/lifecycle/route_observer.dart';
import 'package:my_forecast_app/core/routing/routes_actions.dart';
import 'package:my_forecast_app/initial/multiproviders.dart';
import 'package:my_forecast_app/initial/provider.dart';
import 'package:provider/provider.dart';

import '../core/routing/routing.dart';

class MyAppLayout extends StatefulWidget {
  const MyAppLayout({Key? key}) : super(key: key);

  @override
  State<MyAppLayout> createState() => _MyAppLayoutState();
}

class _MyAppLayoutState extends State<MyAppLayout> {
  final rootNotifier = AppProvider();

  @override
  void initState() {
    // TODO: implement initState
    rootNotifier.setInitialTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Multiproviders.inject(rootNotifier: rootNotifier),
      child: Selector<AppProvider, ThemeData?>(
        selector: (_, select) => select.themeData,
        builder: (context, value, _){
          return LifecycleManager(
            child: MaterialApp(
              key: materialAppKey,
              title: 'Flutter Demo',
              theme: value,
              navigatorObservers: [
                CustomRouteObserver(),
                CustomRouteObserver.routeObserver
              ],
              onGenerateInitialRoutes: RoutesActions.initialAction,
              onGenerateRoute: RoutesActions.allActions,
              debugShowCheckedModeBanner: false,
              navigatorKey: Routing.navigatorKey,
              scaffoldMessengerKey: Routing.scaffoldMessengerKey,
              builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child ?? Container(color: Colors.white,)),
              // home: const MainScreen(),
            ),
          );
        } ,
      ),
    );
  }
}
