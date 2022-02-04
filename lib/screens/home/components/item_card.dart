import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:picture_galary/models/Product.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2),
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover,
                      )))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(product.title,
                style: TextStyle(
                  color: kTextDarkGreen,
                )),
          ),
          Text(
            "\Rs${product.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
