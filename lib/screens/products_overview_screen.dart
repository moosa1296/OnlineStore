// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myshop/21.1%20badge.dart';
import 'package:myshop/provider/cart.dart';
import 'package:myshop/screens/cartScreen.dart';
import 'package:myshop/widgets/appDrawer.dart';
import 'package:provider/provider.dart';

import '../widgets/products_gridview.dart';

enum filterOptions {
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop'),
          actions: [
            PopupMenuButton(
                onSelected: (filterOptions selectedValue) => {
                      setState(() {
                        if (selectedValue == filterOptions.Favourites)
                          _showOnlyFavourite = true;
                        else {
                          _showOnlyFavourite = false;
                        }
                      })
                    },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Favourite Items'),
                        value: filterOptions.Favourites,
                      ),
                      PopupMenuItem(
                        child: Text('All'),
                        value: filterOptions.All,
                      ),
                    ]),
            Consumer<Cart>(
              builder: (context, cart, ch) =>
                  Badge(child: ch!, value: cart.itemCount.toString()),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () =>
                      {Navigator.of(context).pushNamed(CartScreen.routeName)}),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ProductsGridView(_showOnlyFavourite));
  }
}
