
import 'package:flutter/material.dart';
import 'package:sure_crop/screens/ratings_page.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = 'Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Payment Method:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _buildPaymentOptions(),
            SizedBox(height: 16),
            _buildPaymentFields(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatingReviewPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Center(
                child: Text(
                  'Make Payment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      children: [
        RadioListTile<String>(
          title: Text('Card'),
          value: 'Card',
          groupValue: _selectedPaymentMethod,
          onChanged: (String? value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('UPI'),
          value: 'UPI',
          groupValue: _selectedPaymentMethod,
          onChanged: (String? value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('Bank Transfer'),
          value: 'Bank Transfer',
          groupValue: _selectedPaymentMethod,
          onChanged: (String? value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPaymentFields() {
    switch (_selectedPaymentMethod) {
      case 'Card':
        return _buildCardFields();
      case 'UPI':
        return _buildUPIFields();
      case 'Bank Transfer':
        return _buildBankTransferFields();
      default:
        return Container();
    }
  }

  Widget _buildCardFields() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Card Number'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                keyboardType: TextInputType.datetime,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUPIFields() {
    return TextField(
      decoration: InputDecoration(labelText: 'UPI ID'),
      keyboardType: TextInputType.emailAddress,
    );
  }

  // Bank Transfer payment fields
  Widget _buildBankTransferFields() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Account Number'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(labelText: 'IFSC Code'),
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(labelText: 'Account Holder Name'),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
