import 'package:flutter/material.dart';
import 'package:myshop/provider/orders.dart';
import 'package:myshop/widgets/appDrawer.dart';
import 'package:myshop/widgets/orderItemwidg.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, index) =>
              OrderItemWidg(orderData.orders[index])),
    );
  }
}
