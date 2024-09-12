// product_item.dart
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Card(
child: ListTile(
title: Text('Product Name'),
subtitle: Text('19.99'),
trailing: IconButton(
icon: Icon(Icons.shopping_cart),
onPressed: () {}
),
),
);
}
}