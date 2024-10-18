// lib/product_card.dart

import 'package:flutter/material.dart';
import 'product.dart';
import 'store_details.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback addToCart;
  final List<Product> cartItems;
  final Function(Product) onStoreAddToCart;

  ProductCard({
    required this.product,
    required this.addToCart,
    required this.cartItems,
    required this.onStoreAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreDetails(
                          storeName: product.brand,
                          storeProducts: _getStoreProducts(product.brand),
                          cartItems: cartItems,
                          addToCart: onStoreAddToCart,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    product.brand,
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addToCart,
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Product> _getStoreProducts(String storeName) {
    if (storeName == 'Spar') {
      return [
        Product(name: 'Brown Sugar', brand: 'Spar', price: 2.19, imageUrl: 'assets/sugar.jpg'),
        Product(name: 'Milk', brand: 'Spar', price: 1.99, imageUrl: 'assets/milk.jpg'),
        Product(name: 'Standard White Bread 600g', brand: 'Spar', price: 1.50, imageUrl: 'assets/bread.jpg'),
        Product(name: 'Weet-Bix Wholegrain Wheat Biscuits 900g', brand: 'Spar', price: 2.19, imageUrl: 'assets/Weet_Bix .jpg'),
        //Product(name: 'Milk', brand: 'Spar', price: 1.99, imageUrl: 'assets/milk.jpg'),
        Product(name: 'Danone Ultra Mel Vanilla Flavoured Custard 1L', brand: 'Spar', price: 1.50, imageUrl: 'assets/Ultra_Mel.jpg'),
        // Add more products for Spar
      ];
    } else if (storeName == 'Global Brothers') {
      return [
        Product(name: 'Johnnie Walker', brand: 'Global Brothers', price: 46.99, imageUrl: 'assets/john.jpg'),
        Product(name: 'Wine', brand: 'Global Brothers', price: 15.99, imageUrl: 'assets/wine.jpg'),
        Product(name: 'Carling Black Label Beer Bottle 750ml', brand: 'Global Brothers', price: 15.99, imageUrl: 'assets/Black_Label_Beer.jpg'),
        Product(name: 'Hunters Gold Real Cider Bottle 660ml', brand: 'Global Brothers', price: 15.99, imageUrl: 'assets/Hunters_Gold.jpg'),
        Product(name: 'Brutal Fruit Ruby Apple Spritzer Bottles 6 x 275ml', brand: 'Global Brothers', price: 15.99, imageUrl: 'assets/Brutal_Fruit.jpg'),
        Product(name: 'Windhoek Premium Draught Beer Bottle 440ml', brand: 'Global Brothers', price: 15.99, imageUrl: 'assets/Windhoek_Premium.jpg'),
        // Add more products for Global Brothers Brutal Fruit
      ];
    } else if (storeName == 'Electrosale') {
      return [
        Product(name: 'Lafarge SupaSet', brand: 'Electrosale', price: 7.99, imageUrl: 'assets/cement.jpg'),
        Product(name: 'Hyper Tough 32-Piece Combination Wrench Set', brand: 'Electrosale', price: 22.99, imageUrl: 'assets/Wrench_Set.jpg'),
         Product(name: 'LED Light Bulb', brand: 'Electrosale', price: 6.99, imageUrl: 'assets/Light_Bulb.jpg'),
        Product(name: '15-Amp Grounded 6-Outlet Surge Protector with 2 ft. Braided Extension Cord, Black', brand: 'Electrosale', price: 9.99, imageUrl: 'assets/Extension_Cord.jpg'),
        // Add more products for Electrosale
      ];
    } else if (storeName == 'Clique Pharmacy') {
      return [
        Product(name: 'Paracetamol Tblts', brand: 'Clique Pharmacy', price: 1.29, imageUrl: 'assets/pill.jpg'),
        Product(name: 'MediRite Health 40 Volume Hydrogen Peroxide Solution 100ml', brand: 'Clique Pharmacy', price: 5.99, imageUrl: 'assets/Hydrogen_Peroxide.jpg'),
        Product(name: 'Eno Peppermint Flavour Chewable Tablets 24 Pack', brand: 'Clique Pharmacy', price: 1.29, imageUrl: 'assets/eno.jpg'),
        Product(name: 'Voltaren Pain & Inflammation Relief Emulgel 20g', brand: 'Clique Pharmacy', price: 5.99, imageUrl: 'assets/voltaren.jpg'),
        // Add more products for Clique Pharmacy
      ];
    }
    // Default case or add more stores if needed
    return [
      Product(name: 'Example Product', brand: storeName, price: 9.99, imageUrl: 'assets/example.jpg'),
    ];
  }
}