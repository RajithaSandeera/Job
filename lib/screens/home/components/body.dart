import 'package:flutter/material.dart';
import 'package:picture_galary/models/Product.dart';
import 'package:picture_galary/screens/details/details_screen.dart';

import '../../../constants.dart';
import 'categorries.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/chefbg13.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Text(
                "Jobs",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
                // .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Categories(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          ))),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
