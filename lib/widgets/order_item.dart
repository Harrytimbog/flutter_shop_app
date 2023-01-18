import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/order.dart' as ord;

class OrderItem extends StatelessWidget {
  // ord.OrderItem to resolve the name clash
  final ord.OrderItem order;
  const OrderItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.expand_more)),
          )
        ],
      ),
    );
  }
}
