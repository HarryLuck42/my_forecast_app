import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/constraint/asset_path.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/layout/forgot_password/forgot_password_provider.dart';
import 'package:my_forecast_app/widgets/custom_elevated_button.dart';
import 'package:my_forecast_app/widgets/custom_icon_button.dart';
import 'package:my_forecast_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(builder: (context, ref, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: context.getTheme().colorScheme.background,
          leading: CustomIconButton(
            iconData: '${AssetPath.vector}back_arrow.svg',
            defaultColor: false,
            color: context.getTheme().colorScheme.primary,
            onPressed: () {
              ref.routing.moveBack();
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Forgot password',
                  style: context.getTheme().textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Please enter your email address below to receive password Reset Link.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: context.getTheme().textTheme.headline6?.copyWith(
                        color: context.getTheme().colorScheme.secondary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 16 * context.scaleDiagonal(), horizontal: 12),
                    hintText: 'Your email please',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomElevatedButton(
                      width: context.getWidth(),
                      buttonStyle: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              context.getTheme().colorScheme.primary),
                          overlayColor: MaterialStateProperty.all<Color>(
                              context.getTheme().colorScheme.primary),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              context.getTheme().colorScheme.primary),
                          shadowColor: MaterialStateProperty.all<Color>(
                              context.getTheme().colorScheme.primary)),
                      height: 50,
                      function: () {},
                      child: CustomText(
                        textToDisplay: 'Send Reset Link',
                        textStyle: context
                            .getTheme()
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
