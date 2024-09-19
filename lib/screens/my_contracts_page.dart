import 'package:flutter/material.dart';
import 'package:sure_crop/screens/contract_details.dart';

class MyContractsPage extends StatelessWidget {
  const MyContractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contracts'),
        backgroundColor: const Color(0xFF33A864),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Active Contracts',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Active contract card (only one for now)
            Card(
              color: Colors.white,
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.file_copy, color: Colors.green),
                title: const Text('Contract 001: Rajesh Kumar'),
                subtitle: const Text('Details: 20 tons of wheat'),
                trailing: const Text(
                  'Accepted',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContractDetailsPage()),
                  );
                },
              ),
            ),
            const Spacer(),
            // Disclaimer
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Disclaimer: This is only a draft contract, not an official one. Please consult a legal professional for official drafting and review and kindly get it signed by the farmer and upload it on the application.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}