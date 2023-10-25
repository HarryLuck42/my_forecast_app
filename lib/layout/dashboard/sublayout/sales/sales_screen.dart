import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/core/routing/routes.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/sales/sales_provider.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/sales/widget/customer_card.dart';
import 'package:my_forecast_app/widgets/custom_search.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/custom_float_button.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);
  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SalesProvider>(
      builder: (context, ref, _) {
        final products = ref.products;
        final customers = ref.customers;
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomSearch(
                      controller: ref.searchCtrl,
                      contentPadding: EdgeInsets.symmetric(vertical: 16 * context.scaleDiagonal()),
                      hintText: 'Search',
                    ),
                    Expanded(child: customers.isNotEmpty ? SingleChildScrollView(
                      child: Column(
                        children: customers.map((e) => CustomerCard(customer: e)).toList(),
                      )
                    ): const Center(child: CustomText(textToDisplay: 'Please Add Contact',)),)
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20,
                bottom: 20,
                child: CustomFloatButton(onClick: (){
                  ref.routing.move(Routes.addContact);
                },))
          ],
        );
      }
    );
  }
}
