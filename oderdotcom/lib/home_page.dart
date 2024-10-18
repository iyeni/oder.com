// lib/home_page.dart

import 'package:flutter/material.dart';
import 'package:oderdotcom/account_page.dart';
import 'package:oderdotcom/cart_page.dart';
import 'package:oderdotcom/marketplace.dart';
import 'product.dart';
import 'product_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> products = [
    Product(name: 'Johnnie Walker', brand: 'Global Brothers', price: 46.99, imageUrl: 'assets/john.jpg'),
    Product(name: 'Lafarge SupaSet', brand: 'Electrosale', price: 7.99, imageUrl: 'assets/cement.jpg'),
    Product(name: 'Brown Sugar', brand: 'Spar', price: 2.19, imageUrl: 'assets/sugar.jpg'),
    Product(name: 'Paracetamol Tblts', brand: 'Clique Pharmacy', price: 1.29, imageUrl: 'assets/pill.jpg'),
    Product(name: 'Product1', brand: 'Global Brothers', price: 6.99, imageUrl: 'assets/john.jpg'),
    Product(name: 'Product2', brand: 'Electrosale', price: 5.99, imageUrl: 'assets/cement.jpg'),
    Product(name: 'Product3', brand: 'Spar', price: 8.19, imageUrl: 'assets/sugar.jpg'),
    Product(name: 'Product4', brand: 'Clique Pharmacy', price: 1.29, imageUrl: 'assets/pill.jpg'),
    // Add more products as needed
  ];

  final List<Product> cartItems = [];
  String searchQuery = '';
  int _currentIndex = 0;
  final String username = 'Jane Doe';
  final bool isLoggedIn = false;

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
    updateCartBadge();
  }

  int getTotalQuantity() {
    return cartItems.length;
  }

  void updateCartBadge() {
    setState(() {});
  }

  List<Widget> get _pages => [
        HomePageContent(products: products, searchQuery: searchQuery, addToCart: addToCart, cartItems: cartItems),
        MarketPlaceScreen(),
        CartPage(isLoggedIn: isLoggedIn, cartItems: cartItems, updateCartBadge: updateCartBadge),
        AccountPage(username: username),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 3
          ? null
          : AppBar(
              title: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search Luna',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 242, 59, 3),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white54,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? Colors.yellow : Colors.white54,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: _currentIndex == 1 ? Colors.yellow : Colors.white54,
            ),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: _currentIndex == 2 ? Colors.yellow : Colors.white54,
                ),
                if (getTotalQuantity() > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '${getTotalQuantity()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _currentIndex == 3 ? Colors.yellow : Colors.white54,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final List<Product> products;
  final String searchQuery;
  final Function(Product) addToCart;
  final List<Product> cartItems;

  HomePageContent({
    required this.products,
    required this.searchQuery,
    required this.addToCart,
    required this.cartItems,
  });

  void _showSnackBar(BuildContext context, String productName) {
    final snackBar = SnackBar(
      content: Text('$productName added to cart!'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        if (products[index].name.toLowerCase().contains(searchQuery)) {
          return ProductCard(
            product: products[index],
            addToCart: () {
              addToCart(products[index]);
              _showSnackBar(context, products[index].name);
            },
            cartItems: cartItems,
            onStoreAddToCart: addToCart,
          );
        } else {
          return Container();
        }
      },
    );
  }
}