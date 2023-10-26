import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/base/base_state.dart';
import 'package:my_forecast_app/core/constraint/asset_path.dart';
import 'package:my_forecast_app/layout/splash/splash_provider.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BaseState{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset('${AssetPath.image}splash_image.png', height: 150, width: 150,)),
          const CustomText(textToDisplay: 'My Weather App')
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    context.read<SplashProvider>().validationPage(context);
  }
}
