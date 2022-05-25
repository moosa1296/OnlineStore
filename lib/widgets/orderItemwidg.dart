import 'package:flutter/material.dart';
import 'package:myshop/provider/orders.dart';
import 'package:myshop/provider/products.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItemWidg extends StatefulWidget {
  OrderList order;

  OrderItemWidg(this.order);

  @override
  State<OrderItemWidg> createState() => _OrderItemWidgState();
}

class _OrderItemWidgState extends State<OrderItemWidg> {
  bool _expanded = false;
  // const OrderItemWidg({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Order>(context);
    return Card(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          ListTile(
            title: Text('${widget.order.amount.toStringAsFixed(2)}'),
            subtitle: Text(
                DateFormat('dd-MM-yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: min(widget.order.cartProducts.length * 20.0 + 10, 180),
              child: ListView(
                children: [
                  ...widget.order.cartProducts
                      .map((prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(prod.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('${prod.price} x ${prod.quantity}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ))
                      .toList(),
                ],
              ),
            )
        ],
      ),
    );
  }
}
