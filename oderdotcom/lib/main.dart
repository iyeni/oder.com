import 'package:flutter/material.dart';
import 'package:oderdotcom/home_page.dart';


void main() {
  runApp(OrderDotComApp());
}

class OrderDotComApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrderDotCom',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}