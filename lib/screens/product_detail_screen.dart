import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProductsProvider>(context,
            listen:
                false) // listen: true is default. I made it false because I don't want product details screen to always rebuild whenever ProductProvider has a change / updates
        .findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
    );
  }
}
