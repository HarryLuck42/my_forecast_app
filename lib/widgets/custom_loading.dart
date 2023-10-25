import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_forecast_app/core/constraint/asset_path.dart';
import 'package:my_forecast_app/core/extention/extention.dart';

class CustomLoading extends StatelessWidget {
  final double size;

  const CustomLoading({Key? key, this.size = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "${AssetPath.json}general_loading.json",
      width: size * 16 * context.scaleDiagonal(),
      height: size * 9 * context.scaleDiagonal(),
    );
  }
}