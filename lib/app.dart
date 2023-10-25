import 'dart:async';

import 'package:flutter/services.dart';
import 'package:my_forecast_app/core/config/env.dart';
import 'package:my_forecast_app/core/constraint/enum.dart';
import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/core/helper/helper.dart';
import 'package:my_forecast_app/initial/screen.dart';

import 'core/memory/share_preference.dart';

final GlobalKey<ScaffoldState> materialAppKey = GlobalKey<ScaffoldState>();

void myAppStarts(EnvType environment)async{

  runZonedGuarded(() async{

    WidgetsFlutterBinding.ensureInitialized();
    Env.init(environment);
    await SharedPreference.onInitialSharedPreferences();
    Helper().systemUIOverlayTheme();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp( const MyAppLayout());
  }, (error, stack) {
    'error run myAppStarts: $error'.logger();
  });

}