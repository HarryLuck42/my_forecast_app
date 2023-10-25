import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/layout/dashboard/sublayout/stocks/stocks_provider.dart';
import 'package:provider/provider.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({Key? key}) : super(key: key);

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
  int totalStock = 0;
  double totalSalePrice = 0;
  double totalParPrice = 0;

  @override
  void initState() {
    // getAllTotal();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<StocksProvider>(
      builder: (context, ref, _) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 10.0),
                        DataTable(
                          horizontalMargin: 20.0,
                          columnSpacing: 50.0,
                          headingRowColor: MaterialStateColor.resolveWith((states) => context.getTheme().colorScheme.primary.withOpacity(0.2)),
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Product',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'QTY',
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 70,
                                child: Text(
                                  'Purchase Price',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 60,
                                child: Text(
                                  'Sale Price',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                          rows: const [],
                        ),
                        ListView.builder(
                            itemCount: ref.products.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ref.products[index].productName,
                                            textAlign: TextAlign.start,
                                            style: context.getTheme().textTheme.bodyText1?.copyWith(color: int.parse(ref.products[index].productStock) < 20 ? Colors.red : Colors.black),
                                          ),
                                          Text(
                                            ref.products[index].brandName,
                                            textAlign: TextAlign.start,
                                            style: context.getTheme().textTheme.bodyText2?.copyWith(color: int.parse(ref.products[index].productStock) < 20 ? Colors.red : context.getTheme().colorScheme.secondary),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                          ref.products[index].productStock,
                                          style: context.getTheme().textTheme.bodyText2?.copyWith(color: int.parse(ref.products[index].productStock) < 20 ? Colors.red : Colors.black),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            '\$${ref.products[index].productPurchasePrice}',
                                            style: context.getTheme().textTheme.bodyText2?.copyWith(color: int.parse(ref.products[index].productStock) < 20 ? Colors.red : Colors.black),
                                          ),
                                        )),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '\$${ref.products[index].productSalePrice}',
                                          style: context.getTheme().textTheme.bodyText2?.copyWith(color: int.parse(ref.products[index].productStock) < 20 ? Colors.red : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              color: context.getTheme().colorScheme.primary.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Total',
                        textAlign: TextAlign.start,
                        style: context.getTheme().textTheme.bodyText2?.copyWith(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        totalStock.toString(),
                        style: context.getTheme().textTheme.bodyText2?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          '\$${totalParPrice.toString()}',
                          style: context.getTheme().textTheme.bodyText2?.copyWith(
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      width: 80,
                      child: Text(
                        '\$${totalSalePrice.toString()}',
                        style: context.getTheme().textTheme.bodyText2?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
