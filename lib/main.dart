import 'package:flutter/material.dart';
import 'package:sure_crop/screens/languages_page.dart';
import 'screens/login_page.dart';
import 'screens/buyer_home_page.dart';
import 'screens/seller_home_page.dart';
import 'screens/signup_page.dart';
import 'screens/create_contract.dart';

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
        primaryColor: Color(0xFF33A864),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LanguageSelectionPage(),
        '/signin': (context) => LogInPage(),
        '/signup': (context) => SignUpPage(),
        '/buyerHome': (context) => BuyerHomePage(),
        '/sellerHome': (context) => SellerHomePage(),
        '/contractForm': (context) => ContractForm(),
      },
    );
  }
}
