import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_forecast_app/core/constraint/sp_keys.dart';

import '../memory/share_preference.dart';
import '../themes/app_colors.dart';

extension LoggerExtension<T> on T {
  void logger() {
    if (kDebugMode) {
      print('Log my app => $this');
    }
  }
}

extension StringDefine on String{

  bool isUrlLink(){
    RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    return exp.hasMatch(this);
  }

  String getImage(){
    return split('/').last;
  }

  String convert(String format){
    return DateFormat(format).format(DateTime.parse(this));
  }
}

extension IntDefine on int{
  String getDirImage(){
    return this == 1 ? 'day' : 'night';
  }
}

extension ContextScreen on BuildContext {

  showShackBar(String message, {isSuccess = false}){
    final snackBar = SnackBar(
      backgroundColor: isSuccess ? Green : null,
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  ColorScheme getColorScheme() {
    return Theme.of(this).colorScheme;
  }

  TextTheme getTextTheme() {
    return Theme.of(this).textTheme;
  }

  double getWidth() {
    return MediaQuery.of(this).size.width;
  }

  double getHeight() {
    return MediaQuery.of(this).size.height;
  }

  double paddingBottom() => MediaQuery.of(this).padding.bottom;

  double paddingTop() => MediaQuery.of(this).padding.top;

  double screenDiagonal() => sqrt((getHeight() * getHeight()) + (getWidth() * getHeight()));

  double scaleDiagonal() => screenDiagonal() / (sqrt((414 * 414) + (895 * 895)));

  ThemeData getTheme() {
    return Theme.of(this);
  }

  bool isLightMode() {
    return SharedPreference().readStorage(SpKeys.isLightTheme) ?? false;
  }

  // String getNameByDate() {
  //   final DateTime now = DateTime.now();
  //   final DateFormat formatter = DateFormat('yyyyMMdd_HHmmss');
  //   return formatter.format(now);
  // }

  String getCurrentDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }



}
