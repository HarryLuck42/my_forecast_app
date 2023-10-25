import 'package:flutter/material.dart';
import 'package:my_forecast_app/core/extention/extention.dart';

class ProductCard extends StatefulWidget {
  ProductCard(
      {Key? key,
        required this.productTitle,
        required this.productDescription,
        required this.productPrice,
        required this.productImage})
      : super(key: key);

  // final Product product;
  String productImage, productTitle, productDescription, productPrice;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.productImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      widget.productTitle,
                      style: context.getTheme().textTheme.headline6,
                    ),
                    // const SizedBox(width: 5),
                    // Text(
                    //   ' X $quantity',
                    //   style: GoogleFonts.jost(
                    //     fontSize: 14.0,
                    //     color: Colors.grey.shade500,
                    //   ),
                    // ).visible(quantity != 0),
                  ],
                ),
                Text(
                  widget.productDescription,
                  style: context.getTheme().textTheme.bodyText2,
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            '\$${widget.productPrice}',
            style: context.getTheme().textTheme.headline6,
          ),
        ],
      ),
    );
  }
}