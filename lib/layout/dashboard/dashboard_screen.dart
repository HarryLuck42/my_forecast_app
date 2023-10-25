import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/base/base_state.dart';
import 'package:my_forecast_app/core/constraint/asset_path.dart';
import 'package:my_forecast_app/core/constraint/enum.dart';
import 'package:my_forecast_app/core/constraint/sp_keys.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/core/routing/routes.dart';
import 'package:my_forecast_app/layout/dashboard/dashboard_provider.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/customer/customer_screen.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/purchase/purchase_screen.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/reports/reports_screen.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/sales/sales_screen.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/stocks/stocks_screen.dart';
import 'package:my_forecast_app/layout/dashboard/widget/item_tab.dart';
import 'package:my_forecast_app/widgets/custom_icon_dropdown_button.dart';
import 'package:my_forecast_app/widgets/custom_icon.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_app_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with BaseState {
  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, ref, _) {
      return Scaffold(
          appBar: CustomAppBar(context, helper.getTitleAppBar(ref.currentTab),
              isBack: false,
              actions: [
                CustomIconDropdownButton(
                    icon: CustomIcon(
                      iconData: '${AssetPath.vector}setting.svg',
                      defaultColor: false,
                      color: context.getTheme().colorScheme.primary,
                    ),
                    style: context.getTheme().textTheme.bodyText2,
                    items: ['Logout'],
                    onTap: (value){
                      print('value dropdown $value');
                      if(value == 'Logout'){
                        ref.sharedPre.removeValue(SpKeys.apiToken);
                        ref.routing.moveReplacement(Routes.login);
                      }
                    },
                    onChange: (value) {})
              ]),
          body: SafeArea(child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: _tabScreen(ref.currentTab),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: context.getTheme().colorScheme.background,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.06), blurRadius: 7)
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TabItem(
                            isActive: ref.currentTab == AppTab.reports,
                            icon: 'ic_report.svg',
                            title: 'Reports',
                            onClick: () {
                              ref.currentTab = AppTab.reports;
                            },
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: TabItem(
                                isActive: ref.currentTab == AppTab.sales,
                                icon: 'ic_sales.svg',
                                title: 'Sales',
                                onClick: () {
                                  ref.currentTab = AppTab.sales;
                                })),
                        Flexible(
                            flex: 1,
                            child: TabItem(
                                isActive: ref.currentTab == AppTab.database,
                                icon: 'ic_customer.svg',
                                title: 'Customer',
                                onClick: () {
                                  ref.currentTab = AppTab.database;
                                })),
                        Flexible(
                            flex: 1,
                            child: TabItem(
                                isActive: ref.currentTab == AppTab.purchase,
                                icon: 'ic_purchase.svg',
                                title: 'Purchase',
                                onClick: () {
                                  ref.currentTab = AppTab.purchase;
                                })),
                        Flexible(
                            flex: 1,
                            child: TabItem(
                                isActive: ref.currentTab == AppTab.stocks,
                                icon: 'ic_stock.svg',
                                title: 'Stocks',
                                onClick: () {
                                  ref.currentTab = AppTab.stocks;
                                }))
                      ],
                    ),
                  )
                ],
              );
            },
          )));
    });
  }

  Widget _tabScreen(AppTab tab) {
    switch (tab) {
      case AppTab.reports:
        return ReportsScreen();
      case AppTab.sales:
        return SalesScreen();
      case AppTab.database:
        return CustomerScreen();
      case AppTab.purchase:
        return PurchaseScreen();
      case AppTab.stocks:
        return StocksScreen();
    }
  }
}
