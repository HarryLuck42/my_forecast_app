import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/constraint/spacer.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/model/customer.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';

import '../../../../../core/themes/app_colors.dart';

class CustomerCard extends StatelessWidget {
  Customer customer;
  CustomerCard({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 2)],
          borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: context.getTheme().colorScheme.background,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: InkWell(
            onTap: (){},
            highlightColor: context.getTheme().colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textToDisplay: customer.customerName,
                        textStyle: context.getTheme().textTheme.bodyText1?.copyWith(color: Primary, fontWeight: FontWeight.bold),),
                      fourPx,
                      CustomText(textToDisplay: customer.type, textStyle: context.getTheme().textTheme.bodyText2,)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: context.getTheme().colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
