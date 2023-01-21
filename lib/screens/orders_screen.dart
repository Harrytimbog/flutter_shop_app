import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late Future _ordersFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('Building orders'); // to confirm that the whole widget is only built once
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Your Orders')),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: _ordersFuture,
          builder: (ctx, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapShot.error != null) {
                // ...
                // Do error handling stuff
                return const Center(
                  child: Text('An error occurred!'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => (orderData.orders.isEmpty
                      ? const Center(
                          child: Text('You have no order history yet!'))
                      : ListView.builder(
                          itemBuilder: (ctx, i) =>
                              OrderItem(orderData.orders[i]),
                          itemCount: orderData.orders.length,
                        )),
                );
              }
            }
          },
        ));
  }
}
