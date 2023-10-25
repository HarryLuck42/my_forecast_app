import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/purchase/purchase_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/routing/routes.dart';
import '../../../../widgets/custom_float_button.dart';
import '../../../../widgets/custom_search.dart';
import '../../../../widgets/custom_text.dart';
import '../sales/widget/customer_card.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {

  Color color = Colors.black26;

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseProvider>(
      builder: (context, ref, _) {
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
