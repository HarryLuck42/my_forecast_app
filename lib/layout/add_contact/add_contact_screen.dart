import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/sales/sales_provider.dart';
import 'package:my_forecast_app/model/customer.dart';
import 'package:my_forecast_app/widgets/custom_radio_button.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';
import 'package:my_forecast_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../core/constraint/spacer.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Add Contact'),
      body: Consumer<SalesProvider>(builder: (context, ref, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    eightPx,
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomText(
                        textToDisplay: 'Phone Number:',
                        textStyle: context
                            .getTheme()
                            .textTheme
                            .subtitle2
                            ?.copyWith(
                                color: context.getTheme().colorScheme.outline,
                                fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomTextField(
                      textInputType: TextInputType.number,
                      controller: ref.phoneCtrl,
                      hintText: 'Phone Number',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16 * context.scaleDiagonal(),
                          horizontal: 12),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomText(
                        textToDisplay: 'Name:',
                        textStyle: context
                            .getTheme()
                            .textTheme
                            .subtitle2
                            ?.copyWith(
                                color: context.getTheme().colorScheme.outline,
                                fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomTextField(
                      controller: ref.nameCtrl,
                      hintText: 'Name',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16 * context.scaleDiagonal(),
                          horizontal: 12),
                    ),
                    sixteenPx,
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomText(
                        textToDisplay: 'Role:',
                        textStyle: context
                            .getTheme()
                            .textTheme
                            .subtitle2
                            ?.copyWith(
                                color: context.getTheme().colorScheme.outline,
                                fontWeight: FontWeight.w500),
                      ),
                    ),
                    eightPx,
                    CustomRadioButton(
                        values: ['Retail', 'Dealer', 'Wholesaler', 'Supplier'],
                        onChange: (result) {
                          'hasil radio $result'.logger();
                          ref.role = result;
                        }),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                child: CustomElevatedButton(
                  width: context.getWidth(),
                  height: 50,
                  loading: ref.isLoading,
                  buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          context.getTheme().colorScheme.primary),
                      overlayColor: MaterialStateProperty.all<Color>(
                          context.getTheme().colorScheme.primary),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          context.getTheme().colorScheme.primary),
                      shadowColor: MaterialStateProperty.all<Color>(
                          context.getTheme().colorScheme.primary)),
                  function: () {
                    final name = ref.nameCtrl.text;
                    final phoneNumber = ref.phoneCtrl.text;
                    final type = ref.role;
                    ref.addCustomer(Customer(name, phoneNumber, type ?? '', '', '', '', ''));
                  },
                  child: CustomText(
                    textToDisplay: 'Save',
                    textStyle: context
                        .getTheme()
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
