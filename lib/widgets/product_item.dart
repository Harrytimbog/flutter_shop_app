import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(this.id, this.title, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,
        listen:
            true); // Provider.of(context) triggers a build of the entire widget tree although you can handle that with clever widget splitting
    final cart = Provider.of<Cart>(context,
        listen:
            false); // not interesteed in changes to the cart, I just want to dispatch an action
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            // rebuilds only part of the widget tree instead of the entire widget tree
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Added Iteem to Cart!',
                      // textAlign: TextAlign.center,
                    ),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        }),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.secondary,
              )),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
