import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';

class ReportCard extends StatelessWidget {
  ReportCard({
    Key? key,
    required this.pressed,
    required this.iconPath,
    required this.title,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var pressed;
  String iconPath, title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 2)
          ]),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Ink(
          decoration: BoxDecoration(
            color: context.getTheme().colorScheme.background,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              highlightColor: context.getTheme().colorScheme.primary,
              onTap: pressed,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      height: 40,
                      width: 40,
                      image: AssetImage(iconPath),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: context.getTheme().textTheme.bodyText1,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: context.getTheme().colorScheme.primary,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
