import 'package:flutter/material.dart';
import 'package:myshop/provider/cart.dart';
import '../provider/products.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // ProductItem({required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: productProvider.id);
            },
            child: Image.network(
              productProvider.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Products>(
              builder: (context, Products, child) => IconButton(
                onPressed: () {
                  productProvider.toggleFavouriteState();
                },
                icon: Icon(productProvider.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                // color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text(productProvider.title, textAlign: TextAlign.center),
            trailing: IconButton(
                onPressed: () {
                  cart.addItem(productProvider.id, productProvider.price,
                      productProvider.title);
                },
                icon: const Icon(Icons.shopping_cart),
                color: Theme.of(context).primaryColor),
          )),
    );
  }
}
