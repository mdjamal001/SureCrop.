import 'package:flutter/material.dart';
import 'package:sure_crop/screens/buyer_home_page.dart';

class FarmerMyContractsPage extends StatefulWidget {
  @override
  _MyContractsPageState createState() => _MyContractsPageState();
}

class _MyContractsPageState extends State<FarmerMyContractsPage> {
  List<Map<String, String>> contracts = [
    {
      'contractID': 'F12345',
      'crop': 'Wheat',
      'buyer': 'John Doe',
      'status': 'Ongoing',
      'startDate': '2024-09-10',
      'endDate': '2024-12-10',
      'quantity': '500kg',
      'price': '₹15000',
    },
    {
      'contractID': 'F67890',
      'crop': 'Rice',
      'buyer': 'Jane Smith',
      'status': 'Ongoing',
      'startDate': '2024-08-01',
      'endDate': '2024-11-01',
      'quantity': '750kg',
      'price': '₹25000',
    },
    {
      'contractID': 'F13579',
      'crop': 'Sugarcane',
      'buyer': 'Tom Wilson',
      'status': 'Ongoing',
      'startDate': '2024-07-15',
      'endDate': '2024-10-15',
      'quantity': '1000kg',
      'price': '₹35000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contracts'),
        backgroundColor: primaryCol,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: contracts.length,
                itemBuilder: (context, index) {
                  final contract = contracts[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 8,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contract ID: ${contract['contractID']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Crop: ${contract['crop']}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Buyer: ${contract['buyer']}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Quantity: ${contract['quantity']}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Price: ${contract['price']}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Start Date: ${contract['startDate']}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'End Date: ${contract['endDate']}',
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Action for viewing contract details
                                },
                                child: Text('View Details',style: TextStyle(color: Colors.white),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryCol,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Action for terminating contract
                                },
                                child: Text('Terminate',style: TextStyle(color: Colors.white),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[700],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
