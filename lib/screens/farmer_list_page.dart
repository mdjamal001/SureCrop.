import 'package:flutter/material.dart';
import 'farmers_details_page.dart';

class FarmerListPage extends StatelessWidget {
  final String cropName;
  final List<Map<String, String>> farmers;

  FarmerListPage({required this.cropName, required this.farmers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(),
          child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new)
          ),
        ),
        title: Text('$cropName Farmers',),
        titleSpacing: 0,

        actions: [
          Icon(Icons.search),
          SizedBox(width: 25),
          Icon(Icons.filter_alt),
          SizedBox(width: 10,)
        ],

      ),
      body: ListView.builder(
        itemCount: farmers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(top: 10,left: 8,right: 8),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                farmers[index]['name']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text("Rating: ${farmers[index]['rating']}"),
                  Text("Price: ₹${farmers[index]['price']}/kg"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FarmerDetailsPage(
                      farmerName: farmers[index]['name']!,
                      cropName: cropName,
                      price: farmers[index]['price']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
