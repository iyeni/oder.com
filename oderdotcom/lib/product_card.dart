import 'package:flutter/material.dart';
import 'product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback addToCart;

  const ProductCard({
    Key? key,
    required this.product,
    required this.addToCart,
  }) : super(key: key);

  void _showAddToCartAnimation(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('${product.name} added to cart!'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.brand,
              style: TextStyle(color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                addToCart();
                _showAddToCartAnimation(context);
              },
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}