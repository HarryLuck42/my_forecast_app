import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/base/base_state.dart';
import 'package:my_forecast_app/core/routing/routing.dart';
import 'package:my_forecast_app/layout/home/home_provider.dart';
import 'package:my_forecast_app/layout/home/widget/forecast_item.dart';
import 'package:my_forecast_app/widgets/custom_app_bar.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../widgets/loading_shimmer_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BaseState {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, ref, _) {
        final hours = ref.hoursList;
        return Scaffold(
          appBar: CustomAppBar(context, 'My Forecast App', isBack: false),
          body: SafeArea(
            child: ref.isLoading ? const LoadingShimmerLayout() : hours.isNotEmpty ? ListView.builder(
              itemCount: hours.length,
                itemBuilder: (context, index){
              return ForecastItem(data: hours[index],);
            }) : const Center(child: CustomText(textToDisplay: 'No Found'),),
          ),
        );
      }
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    context.read<HomeProvider>().getCurrentForecast(context);
  }


}
