import 'package:flutter/material.dart';
import './providers/cart.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products_provider.dart';
import './screens/cart_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Better approach compared to ChangeNotifierProvider.value in this situation (you are newly creating a new object based on a class | since you are not reusing existing objects)
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          // Better approach compared to ChangeNotifierProvider.value in this situation (you are newly creating a new object based on a class | since you are not reusing existing objects)
          create: (ctx) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
            fontFamily: 'Lato'),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
      ),
    );
  }
}
