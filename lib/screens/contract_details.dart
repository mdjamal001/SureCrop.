import 'package:flutter/material.dart';
import 'package:sure_crop/screens/buyer_home_page.dart';
import 'package:sure_crop/screens/chat_page.dart';
import 'package:sure_crop/screens/payment.dart';

class ContractDetailsPage extends StatelessWidget {
  String name = 'Rajesh Kumar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contract Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildContractDetailBox(
                title: 'Date',
                value: '10/12/2024',
              ),
              _buildContractDetailBox(
                title: 'Parties Involved',
                value:
                'Farmer Name: Rajesh Kumar\nFarmer Address: Village XYZ, Uttar Pradesh\nBuyer Name: Mohan Kumar\nBuyer Address: 123 Buyer St, New Delhi',
              ),
              _buildContractDetailBox(
                title: 'Produce Details',
                value: 'Crop Type: Wheat\nQuantity (in kilograms): 20,000',
              ),
              _buildContractDetailBox(
                title: 'Quality Specifications',
                value: 'Quality Grade: A\nOther Specifications: N/A',
              ),
              _buildContractDetailBox(
                title: 'Payment Terms',
                value:
                'Price per Kilogram: ₹25\nTotal Price: ₹5,00,000\nPayment Method: Bank Transfer\nPayment Schedule: Upon Delivery',
              ),
              _buildContractDetailBox(
                title: 'Delivery Terms',
                value:
                'Delivery Date: 20/12/2024\nDelivery Location: Buyer Warehouse\nMode of Delivery: Third-Party Transport',
              ),
              _buildContractDetailBox(
                title: 'Contract Duration',
                value: 'Start Date: 10/12/2024\nEnd Date: 10/03/2025',
              ),
              SizedBox(height: 20),
              _buildLargeButton(
                label: 'Chat',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(
                          userName: name,
                        )),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildLargeButton(
                label: 'Track Progress',
                onPressed: () {
                },
              ),
              SizedBox(height: 20),
              _buildLargeButton(
                label: 'Payment',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContractDetailBox(
      {required String title, required String value}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeButton(
      {required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryCol,
        padding: EdgeInsets.symmetric(
            vertical: 15),
        textStyle: TextStyle(
            color: Colors.white,
            fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(label,style: TextStyle(color: Colors.white),),
    );
  }
}