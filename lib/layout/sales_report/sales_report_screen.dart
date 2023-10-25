import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/layout/sales_report/sales_report_provider.dart';
import 'package:my_forecast_app/widgets/custom_app_bar.dart';
import 'package:my_forecast_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class SalesReportScreen extends StatefulWidget {
  const SalesReportScreen({Key? key}) : super(key: key);

  @override
  State<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends State<SalesReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SalesReportProvider>(
      builder: (context, ref, _) {
        final transaction = ref.transactions;
        return Scaffold(
          appBar: CustomAppBar(context, 'Sales Report'),
          body: transaction.isNotEmpty ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transaction.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: context.getWidth(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              transaction[index].customerName,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text('#${transaction[index].invoiceNumber}'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: transaction[index].dueAmount! <= 0
                                      ? const Color(0xff0dbf7d).withOpacity(0.1)
                                      : const Color(0xFFED1A3B).withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                transaction[index].dueAmount! <= 0 ? 'Paid' : 'Unpaid',
                                style: TextStyle(color: transaction[index].dueAmount! <= 0 ? const Color(0xff0dbf7d) : const Color(0xFFED1A3B)),
                              ),
                            ),
                            Text(
                              transaction[index].purchaseDate.substring(0, 10),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Total : \$ ${transaction[index].totalAmount.toString()}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Due: \$ ${transaction[index].dueAmount.toString()}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {

                                    },
                                    icon: const Icon(
                                      FeatherIcons.printer,
                                      color: Colors.grey,
                                    )),
                                IconButton(
                                    onPressed: () =>{},
                                    icon: const Icon(
                                      FeatherIcons.share,
                                      color: Colors.grey,
                                    )),
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(
                                      FeatherIcons.moreVertical,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    width: context.getWidth(),
                    color: Colors.grey,
                  )
                ],
              );
            },
          ): const Center(child: CustomText(textToDisplay: 'No Data')),
        );
      }
    );
  }
}
