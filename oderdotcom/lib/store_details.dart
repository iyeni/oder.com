// lib/store_details.dart

import 'package:flutter/material.dart';
import 'product.dart';
import 'product_card.dart';

class StoreDetails extends StatelessWidget {
  final String storeName;
  final List<Product> storeProducts;
  final List<Product> cartItems;
  final Function(Product) addToCart;

  StoreDetails({
    required this.storeName,
    required this.storeProducts,
    required this.cartItems,
    required this.addToCart,
  });

  void _showSnackBar(BuildContext context, String productName) {
    final snackBar = SnackBar(
      content: Text('$productName added to cart!'),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storeName),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: storeProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: storeProducts[index],
            addToCart: () {
              addToCart(storeProducts[index]);
              _showSnackBar(context, storeProducts[index].name);
            },
            cartItems: cartItems,
            onStoreAddToCart: addToCart,
          );
        },
      ),
    );
  }
}