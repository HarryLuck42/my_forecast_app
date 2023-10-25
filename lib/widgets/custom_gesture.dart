import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';

class CustomGesture extends StatelessWidget {
  final double? height;
  final double? width;
  final Function() onTap;
  final Widget child;
  const CustomGesture({Key? key, this.width, this.height, required this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.getColorScheme().background,
        ),
        child: InkWell(
            onTap: onTap,
            splashColor: context.getColorScheme().primary,
            child: child
        ),
      ),
    );
  }
}
