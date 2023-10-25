import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/constraint/asset_path.dart';
import 'package:my_forecast_app/core/routing/routes.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/reports/reports_provider.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/reports/widget/report_card.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReportsProvider>(
      builder: (context, ref, _) {
        return SafeArea(
          child: Column(
            children: [
              ReportCard(
                  pressed: () {
                    // const PurchaseReportScreen().launch(context);
                    ref.routing.move(Routes.transactions);
                  },
                  iconPath: '${AssetPath.image}purchase.png',
                  title: 'Purchase Report'),
              ReportCard(
                  pressed: () {
                    // const SalesReportScreen().launch(context);
                    ref.routing.move(Routes.salesReport);
                  },
                  iconPath: '${AssetPath.image}sales.png',
                  title: 'Sales Report'),
            ],
          ),
        );
      }
    );
  }
}
