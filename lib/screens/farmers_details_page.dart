import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FarmerDetailsPage extends StatelessWidget {
  final String farmerName;
  final String cropName;
  final String price;

  FarmerDetailsPage({required this.farmerName, required this.cropName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$farmerName - $cropName'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Farmer: $farmerName',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Crop: $cropName',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Price: ₹$price/kg',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement chat or initiate contract
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Initiate Contract"),
                      content: Text("Would you like to initiate a contract with $farmerName for $cropName at ₹$price/kg?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle contract initiation
                            Navigator.pop(context);
                          },
                          child: Text("Confirm"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Initiate Contract'),
            ),
          ],
        ),
      ),
    );
  }
}
