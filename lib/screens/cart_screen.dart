import 'package:flutter/material.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    // To style the price display text
    final ThemeData theme = Theme.of(context);
    TextStyle style = theme.textTheme.headline6!.copyWith(
      color: theme.colorScheme.onSecondary,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: style,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary),
                    child: const Text('ORDER NOW'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
