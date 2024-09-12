import 'package:flutter/material.dart';
import 'package:oderdotcom/login_signup_page.dart';
import 'product.dart';

class CartPage extends StatefulWidget {
  final bool isLoggedIn;
  final List<Product> cartItems;
  final Function() updateCartBadge;

  CartPage({required this.isLoggedIn, required this.cartItems, required this.updateCartBadge});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Map<Product, int> _productQuantities = {};

  @override
  void initState() {
    super.initState();
    for (var product in widget.cartItems) {
      _productQuantities[product] = (_productQuantities[product] ?? 0) + 1;
    }
  }

  void _increaseQuantity(Product product) {
    setState(() {
      _productQuantities[product] = (_productQuantities[product] ?? 0) + 1;
      widget.cartItems.add(product);
    });
    widget.updateCartBadge();
  }

  void _decreaseQuantity(Product product) {
    setState(() {
      if (_productQuantities[product]! > 1) {
        _productQuantities[product] = _productQuantities[product]! - 1;
        widget.cartItems.remove(product);
      } else {
        _productQuantities.remove(product);
        widget.cartItems.remove(product);
      }
    });
    widget.updateCartBadge();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: _productQuantities.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: _productQuantities.length,
              itemBuilder: (context, index) {
                final product = _productQuantities.keys.elementAt(index);
                final quantity = _productQuantities[product]!;
                return ListTile(
                  leading: Image.asset(product.imageUrl, width: 50, height: 50),
                  title: Text(product.name),
                  subtitle: Text('Total: \$${(product.price * quantity).toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => _decreaseQuantity(product),
                      ),
                      Text('$quantity', style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _increaseQuantity(product),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => onCheckoutButtonPressed(context, widget.isLoggedIn),
          child: Text('Proceed to Checkout'),
        ),
      ),
    );
  }

  void onCheckoutButtonPressed(BuildContext context, bool isLoggedIn) {
    if (!isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginSignupPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Proceeding to checkout...')),
      );
    }
  }
}