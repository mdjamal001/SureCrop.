import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/buyer_home_page.dart';
import 'screens/seller_home_page.dart';
import 'screens/signup_page.dart';
import 'screens/create_contract.dart';
import 'screens/subcategory_page.dart';// Import other screens as needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String? get categori => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmer-Buyer Contract',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LogInPage(),
        '/signup': (context) => SignUpPage(),
        '/buyerHome': (context) => BuyerHomePage(),
        '/sellerHome': (context) => SellerHomePage(),
        '/contractForm': (context) => ContractForm(),
      },
    );
  }
}
