import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/core/routing/routes.dart';
import 'package:my_forecast_app/core/routing/routing.dart';
import 'package:my_forecast_app/core/themes/app_colors.dart';
import 'package:my_forecast_app/model/response/forecast_response.dart';
import 'package:my_forecast_app/widgets/custom_cache_image.dart';
import 'package:my_forecast_app/widgets/custom_gesture.dart';
import 'package:my_forecast_app/widgets/custom_loading.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/spacer.dart';

class ForecastItem extends StatelessWidget {
  final Hour data;
  const ForecastItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGesture(
      onTap: () {
        Routing().move(Routes.forecastDetail, argument: data);
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sixteenPx,
              Image.asset(
                '${AssetPath.image}${data.isDay?.getDirImage()}/${data.condition?.icon?.getImage()}',
                width: 70,
                height: 70,
                fit: BoxFit.fill,
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 10, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textToDisplay: (data.time ?? '')
                          .convert('EEE, MMM d, yyyy hh:mm aaa'),
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    fourPx,
                    CustomText(
                      textToDisplay: data.condition?.name ?? '',
                      textStyle: const TextStyle(fontSize: 16, color: findColor),
                    ),
                    fourPx,
                    CustomText(
                      textToDisplay: 'Temp: ${data.temperature ?? 0.0}°C',
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ))
            ],
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
