// lib/marketplace_screen.dart

import 'package:flutter/material.dart';

class MarketPlaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDropdownButton(
            context,
            'Shop by Department',
            [
              'Produce', 'Dairy', 'Bakery', 'Meat', 'Seafood',
              'Frozen Foods', 'Canned Goods', 'Beverages',
              'Snacks', 'Household Items', 'Personal Care'
            ],
          ),
          SizedBox(height: 10),
          _buildDropdownButton(
            context,
            'Shop by Store',
            [
              'Walmart', 'Target', 'Costco', 'Kroger',
              'Whole Foods', 'Trader Joe\'s', 'Safeway', 'Publix'
            ],
          ),
          SizedBox(height: 10),
          _buildDropdownButton(
            context,
            'Deals of the Day',
            [
              'Amazon', 'eBay', 'Best Buy', 'Home Depot',
              'Lowe\'s', 'Macy\'s', 'Nordstrom', 'Sephora'
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(BuildContext context, String hint, List<String> items) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(hint, style: TextStyle(color: Colors.black)),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}
