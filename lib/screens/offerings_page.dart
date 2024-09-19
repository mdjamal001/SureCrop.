import 'package:flutter/material.dart';
import 'package:sure_crop/screens/buyer_home_page.dart';
import 'package:sure_crop/screens/contract_details.dart';

import 'buyeroffercontract_page.dart';

class OfferingsPage extends StatelessWidget {
  final List<Map<String, String>> buyers = [
    {
      'buyerName': 'Junaid',
      'pricePerKg': '₹50',
      'quantity': '100 kg',
      'deliveryDate': '2024-10-01',
      'paymentMethod': 'UPI'
    },
    {
      'buyerName': 'Mohan',
      'pricePerKg': '₹45',
      'quantity': '150 kg',
      'deliveryDate': '2024-09-29',
      'paymentMethod': 'Cash'
    },
    {
      'buyerName': 'Kamlesh',
      'pricePerKg': '₹55',
      'quantity': '200 kg',
      'deliveryDate': '2024-10-05',
      'paymentMethod': 'Online Transfer'
    },
    {
      'buyerName': 'Suresh',
      'pricePerKg': '₹48',
      'quantity': '120 kg',
      'deliveryDate': '2024-10-03',
      'paymentMethod': 'UPI'
    },
    {
      'buyerName': 'Mangesh',
      'pricePerKg': '₹52',
      'quantity': '180 kg',
      'deliveryDate': '2024-09-28',
      'paymentMethod': 'Cash'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buyer Offerings'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: buyers.length,
        itemBuilder: (context, index) {
          final buyer = buyers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                buyer['buyerName']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text("Price: ${buyer['pricePerKg']}"),
                  Text("Quantity: ${buyer['quantity']}"),
                  Text("Delivery Date: ${buyer['deliveryDate']}"),
                  Text("Payment Method: ${buyer['paymentMethod']}"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuyerDetailsPage(
                      buyerName: buyer['buyerName']!,
                      pricePerKg: buyer['pricePerKg']!,
                      quantity: buyer['quantity']!,
                      deliveryDate: buyer['deliveryDate']!,
                      paymentMethod: buyer['paymentMethod']!,
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

class BuyerDetailsPage extends StatelessWidget {
  final String buyerName;
  final String pricePerKg;
  final String quantity;
  final String deliveryDate;
  final String paymentMethod;

  BuyerDetailsPage({
    required this.buyerName,
    required this.pricePerKg,
    required this.quantity,
    required this.deliveryDate,
    required this.paymentMethod,
  });

  void _acceptOffer(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Offer Accepted!')),
    );
    Navigator.pop(context);
  }

  void _declineOffer(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Offer Declined!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Details'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Offer from $buyerName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Price per kg: $pricePerKg',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Quantity: $quantity',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Delivery Date: $deliveryDate',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Payment Method: $paymentMethod',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyeroffercontractPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
                child: Text(
                  "View proposed contract",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _declineOffer(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  ),
                  child: Text(
                    'Decline',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _acceptOffer(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  ),
                  child: Text(
                    'Accept',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: OfferingsPage()));
