import 'package:flutter/material.dart';

class SubCategoryPage extends StatelessWidget{

  final String? categori;
  final String category;

  SubCategoryPage(this.categori, {required this.category});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          categori!,
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(

      ),
    );
  }
}