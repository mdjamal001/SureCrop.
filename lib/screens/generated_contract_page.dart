import 'package:flutter/material.dart';
import 'package:sure_crop/screens/buyer_home_page.dart';

class GeneratedContractPage extends StatefulWidget {
  @override
  _GeneratedContractPageState createState() => _GeneratedContractPageState();
}

class _GeneratedContractPageState extends State<GeneratedContractPage> {
  bool _isContractSent =
  false; // This keeps track of whether the contract has been sent

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contract Generated'),
      ),
      body: SingleChildScrollView(
        // Allow scrolling for long content
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Center(
              child: Text(
                'Contract Agreement for Agricultural Produce',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),

            // Contract Details
            Text(
              'Date: 10/12/2024\n'
                  'Parties Involved\n'
                  'Farmer Name: Rajesh Kumar\n'
                  'Farmer Address: Village XYZ, Uttar Pradesh\n'
                  'Buyer Name: Mohan Kumar\n'
                  'Buyer Address: 123 Buyer St, New Delhi\n\n'
                  'Produce Details\n'
                  'Crop Type: Wheat\n'
                  'Quantity (in kilograms): 20,000\n\n'
                  'Quality Specifications\n'
                  'Quality Grade: A\n'
                  'Other Specifications: N/A\n\n'
                  'Payment Terms\n'
                  'Price per Kilogram: ₹25\n'
                  'Total Price: ₹5,00,000\n'
                  'Payment Method: Bank Transfer\n'
                  'Payment Schedule: Upon Delivery\n\n'
                  'Delivery Terms\n'
                  'Delivery Date: 20/12/2024\n'
                  'Delivery Location: Buyer Warehouse\n'
                  'Mode of Delivery: Third-Party Transport\n\n'
                  'Contract Duration\n'
                  'Start Date: 10/12/2024\n'
                  'End Date: 10/03/2025\n\n'
                  'Termination Clause\n'
                  'Either party may terminate this agreement by providing a written notice of at least 30 days. Grounds for termination include breach of contract, failure to deliver the agreed quantity or quality of produce, or other significant issues.\n\n'
                  'Additional Terms and Conditions\n\n'
                  '1. Force Majeure Clause: In the event of any unforeseen circumstances, including but not limited to natural disasters, government regulations, or acts of God, which prevent either party from fulfilling their obligations, both parties agree to mutually discuss and arrive at a suitable resolution or termination of the contract.\n\n'
                  '2. Dispute Resolution: Any disputes arising out of or related to this contract shall be resolved amicably between the parties. If an amicable resolution is not reached within 30 days, the dispute shall be referred to arbitration, as per the provisions of the Indian Arbitration and Conciliation Act, 1996.\n\n'
                  '3. Confidentiality: Both the Farmer and the Buyer agree to keep all details of this contract, including pricing, delivery schedules, and personal information, confidential and not disclose it to any third party without the prior written consent of the other party.\n\n'
                  '4. Modification of Contract: Any modifications to this contract shall be made in writing and signed by both the Farmer and the Buyer. Verbal agreements will not be considered valid.\n\n'
                  '5. Liability: The Buyer agrees to inspect the produce upon delivery. Any claims regarding quality or quantity must be raised within 7 days of receipt of the produce. After this period, the Farmer will not be liable for any defects or shortages.\n\n'
                  '6. Indemnity: The Farmer shall not be liable for any damages caused by the improper handling or storage of the produce after delivery. The Buyer agrees to indemnify and hold the Farmer harmless from any third-party claims arising from such improper handling.',
              style:
              TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
            ),
            SizedBox(height: 30),

            // Send button or confirmation text
            _isContractSent
                ? Center(
              child: Text(
                'Contract is sent to the Farmer for Review',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
                textAlign: TextAlign.center,
              ),
            )
                : Center(
              child:

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                          Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Green button color
                        minimumSize: Size(100, 60), // Button size
                        textStyle: TextStyle(
                            color: Colors.white, fontSize: 20), // Text style
                      ),
                      child: Text('Edit',style: TextStyle(color: Colors.white),),
                    ),

                    SizedBox(width: 20,),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isContractSent =
                          true; // After sending, change the state
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryCol, // Green button color
                        minimumSize: Size(200, 60), // Button size
                        textStyle: TextStyle(
                            color: Colors.white, fontSize: 18), // Text style
                      ),
                      child: Text('Send Contract',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}