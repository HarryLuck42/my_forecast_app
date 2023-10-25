import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../constraint/enum.dart';
import '../constraint/sp_keys.dart';
import '../memory/share_preference.dart';
import '../themes/app_colors.dart';

class Helper{
  Helper._private();

  static final Helper _instance = Helper._private();

  factory Helper() {
    return _instance;
  }

  Future<bool> checkConnections() async {
    bool connection = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection = true;
      }
    } on SocketException catch (_) {
      connection = false;
    }
    return connection;
  }

  Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  void systemUIOverlayTheme() {
    bool theme = SharedPreference().readStorage(SpKeys.isLightTheme) ?? true;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: theme ? Brightness.light : Brightness.dark,
      statusBarColor: theme ? Surface : LightSurface,
      systemNavigationBarIconBrightness: theme ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: theme ? Surface : LightSurface,
    ));
  }

  String getTitleAppBar(AppTab tab){
    switch(tab){
      case AppTab.purchase:
        return 'Purchase';
      case AppTab.stocks:
        return 'Stocks';
      case AppTab.database:
        return 'Customer';
      case AppTab.reports:
        return 'Reports';
      case AppTab.sales:
        return 'Sales';
    }
  }

  Color getColorType(String type){
    switch(type){
      case 'Retailer':
        return GreenType;
      case 'Wholesaler':
        return BlueType;
      case 'Dealer':
        return RedType;
      case 'Supplier':
        return PurpleType;
      default:
        return Colors.white;
    }
  }
}