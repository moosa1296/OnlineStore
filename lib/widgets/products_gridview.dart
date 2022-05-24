import 'package:flutter/material.dart';
import 'package:myshop/provider/products_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  bool showFavourite;

  ProductsGridView(this.showFavourite);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        showFavourite ? productsData.FavouriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(
            // id: products[index].id,
            // title: products[index].title,
            // imageUrl: products[index].imageUrl),
            ),
      ),
    );
  }
}
