import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;

  const CartItem(this.id, this.price, this.quantity, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    // To style the price display text
    final ThemeData theme = Theme.of(context);
    TextStyle style = theme.textTheme.headline6!.copyWith(
      color: theme.colorScheme.onSecondary,
    );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Chip(
            label: Text(
              '\$$price',
              style: style,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          // I chose to use a chip because it was better to visualize the prices
          //  CircleAvatar(
          //   child: Padding(
          //       padding: const EdgeInsets.all(5),
          //       child: FittedBox(child: Text('\$$price'))),
          // ),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
