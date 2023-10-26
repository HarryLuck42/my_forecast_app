import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/constraint/asset_path.dart';
import 'package:my_forecast_app/core/constraint/spacer.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/core/routing/routes.dart';
import 'package:my_forecast_app/layout/login/login_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<LoginProvider>(builder: (context, ref, child) {
          // final loginProvider = ref.watch(logInProvider);
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('${AssetPath.image}splash_image.png', fit: BoxFit.contain, width: 200, height: 200,),
                  thirtyPx,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      // key: globalKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: ref.emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter your email address',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email can\'n be empty';
                              } else if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // loginProvider.email = value!;

                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: ref.passCtrl,
                            keyboardType: TextInputType.text,
                            obscureText: ref.showPassword,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Please enter a password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  ref.showPassword = !ref.showPassword;
                                },
                                icon: Icon(ref.showPassword ? Icons.visibility_off : Icons.visibility),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password can\'t be empty';
                              } else if (value.length < 4) {
                                return 'Please enter a bigger password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // loginProvider.password = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                         // ref.routing.move(Routes.forgotPassword);
                          ref.isLogin = !ref.isLogin;
                        },
                        child: Text(
                          ref.isLogin ? 'Do you want to register?' : 'Login',
                          style: context.getTheme().textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    width: context.getWidth(),
                    height: 50,
                    loading: ref.isLoading,
                    buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(context.getTheme().colorScheme.primary),
                        overlayColor: MaterialStateProperty.all<Color>(context.getTheme().colorScheme.primary),
                        foregroundColor: MaterialStateProperty.all<Color>(context.getTheme().colorScheme.primary),
                        shadowColor: MaterialStateProperty.all<Color>(context.getTheme().colorScheme.primary)),
                    function: () {
                      if(ref.isLogin){
                        ref.loginApp(context);
                      }else{
                        ref.registerApp(context);
                      }

                    },
                    child: CustomText(
                      textToDisplay: ref.isLogin ? 'Login' : 'Register',
                      textStyle: context.getTheme().textTheme.button?.copyWith(color: Colors.white),
                    ),
                  )
                  // TextButton(onPressed: (){
                  //   ref.loginApp();
                  // }, child: ref.isLoading ? const SizedBox(width: 30, height: 30, child: CustomLoading(),) : Text('Login', style: context.getTheme().textTheme.bodyText2,))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
