import 'package:flutter/material.dart';

import 'custom_shimmer.dart';

class LoadingShimmerLayout extends StatelessWidget {
  const LoadingShimmerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(15, (index) {
          return const CustomShimmer(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            width: double.infinity,
            height: 70,
            radius: 16,
          );
        }),
      ),
    );
  }
}
