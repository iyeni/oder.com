import 'package:flutter/material.dart';
import 'login_signup_page.dart';

class AccountPage extends StatelessWidget {
  final String? username;

  AccountPage({this.username});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = username != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isLoggedIn ? 'Hello, $username' : 'Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isLoggedIn)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginSignupPage()),
                  );
                },
                child: Text('Log In or Sign Up'),
              ),
            if (isLoggedIn) ...[
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text('Orders'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ],
        ),
      ),
    );
  }
}