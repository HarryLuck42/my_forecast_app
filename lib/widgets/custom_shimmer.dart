import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core/themes/app_colors.dart';

class CustomShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final BoxShape? boxShape;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  const CustomShimmer({Key? key, this.height, this.width, this.radius, this.margin, this.padding, this.boxShape, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: LightSecondary,
      baseColor: SkeletonHighlightColor,
      period: const Duration(milliseconds: 800),
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        child: child,
        decoration: BoxDecoration(
          gradient: Skeleton,
          shape: boxShape ?? BoxShape.rectangle,
          borderRadius: boxShape != null ? null : BorderRadius.all(Radius.circular(radius ?? 0)),
        ),
      ),
    );
  }
}