import 'package:flutter/cupertino.dart';
import 'package:myshop/provider/cart.dart';

class OrderList {
  final String id;
  final double amount;
  final List<CartItem> cartProducts;
  final DateTime dateTime;

  OrderList(
      {required this.id,
      required this.amount,
      required this.cartProducts,
      required this.dateTime});
}

class Order with ChangeNotifier {
  List<OrderList> _orders = [];

  List<OrderList> get orders {
    return [..._orders];
  }

  void addOrders(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderList(
            id: DateTime.now().toString(),
            amount: total,
            cartProducts: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
