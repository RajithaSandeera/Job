import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_galary/constants.dart';
import 'package:picture_galary/models/Product.dart';
import 'package:picture_galary/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
        key: null,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new),
        color: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
