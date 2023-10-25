import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/customer/customer_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/routing/routes.dart';
import '../../../../widgets/custom_float_button.dart';
import '../../../../widgets/custom_search.dart';
import '../../../../widgets/custom_text.dart';
import '../sales/widget/customer_card.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  Color color = Colors.black26;
  String searchCustomer = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
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
