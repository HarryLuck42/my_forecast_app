import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/constraint/spacer.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/core/themes/app_colors.dart';
import 'package:my_forecast_app/layout/home/home_provider.dart';
import 'package:my_forecast_app/model/response/forecast_response.dart';
import 'package:my_forecast_app/widgets/custom_app_bar.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../core/constraint/asset_path.dart';

class ForecastDetailScreen extends StatefulWidget {
  final Hour data;
  const ForecastDetailScreen({super.key, required this.data});

  @override
  State<ForecastDetailScreen> createState() => _ForecastDetailScreenState();
}

class _ForecastDetailScreenState extends State<ForecastDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, ref, _) {
      return Scaffold(
        appBar: CustomAppBar(context, 'Weather Detail'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                twentyFourPx,
                CustomText(
                  textToDisplay:
                      (widget.data.time ?? '').convert('EEEE, MMMM d, yyyy'),
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                eightPx,
                CustomText(
                  textToDisplay: (widget.data.time ?? '').convert('hh:mm aaa'),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                twentyPx,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      textToDisplay: '${widget.data.temperature ?? 0.0}°C',
                      textStyle: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: findColor),
                    ),
                    sixteenPx,
                    Image.asset(
                      '${AssetPath.image}${widget.data.isDay?.getDirImage()}/${widget.data.condition?.icon?.getImage()}',
                      width: 85,
                      height: 85,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                twentyFourPx,
                CustomText(
                  textToDisplay: widget.data.condition?.name ?? '-',
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
                twentyFourPx,
                Row(
                  children: [
                    Expanded(child: CustomText(textToDisplay: 'Temp(Min)')),
                    Expanded(child: CustomText(textToDisplay: 'Temp(Max)'))
                  ],
                ),
                Builder(builder: (context) {
                  final day = ref.forecast?.forecastDays
                      ?.where((element) =>
                          element.date?.convert('yyyy-MM-dd') ==
                          widget.data.time?.convert('yyyy-MM-dd'))
                      .first
                      .day;
                  return Row(
                    children: [
                      Expanded(
                          child: CustomText(
                        textToDisplay: '${day?.minTemp}°C',
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: findColor),
                      )),
                      Expanded(
                          child: CustomText(
                        textToDisplay: '${day?.maxTemp}°C',
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: findColor),
                      ))
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
