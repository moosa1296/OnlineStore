import 'package:flutter/cupertino.dart';

class Products with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavourite;

  Products(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.price,
      this.isFavourite = false});

  void toggleFavouriteState() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
