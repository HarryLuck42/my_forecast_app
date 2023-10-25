import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/constraint/asset_path.dart';
import 'package:my_forecast_app/core/constraint/spacer.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/widgets/custom_icon.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';

class TabItem extends StatelessWidget {
  bool isActive;
  String icon;
  String title;
  Function? onClick;
  TabItem(
      {Key? key,
      required this.isActive,
      required this.icon,
      required this.title,
        this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          if(onClick != null){
            onClick!();
          }
        },
        highlightColor: context.getTheme().colorScheme.primary,
        child: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              border: isActive
                  ? Border(
                      bottom: BorderSide(
                          width: 5, color: context.getTheme().colorScheme.primary))
                  : null),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIcon(
                iconData: '${AssetPath.vector}$icon',
                width: 30,
                height: 30,
                defaultColor: false,
                color: isActive
                    ? context.getTheme().colorScheme.primary
                    : context.getTheme().colorScheme.secondary,
              ),
              fourPx,
              CustomText(
                textToDisplay: title,
                textStyle: context.getTheme().textTheme.bodyText2?.copyWith(
                    color: isActive
                        ? context.getTheme().colorScheme.primary
                        : context.getTheme().colorScheme.secondary),
              ),
              tenPx,
            ],
          ),
        ),
      ),
    );
  }
}
