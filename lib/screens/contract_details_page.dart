import 'package:flutter/material.dart';
import 'package:sure_crop/screens/buyer_home_page.dart';

class ContractDetailsPage extends StatelessWidget {
  final TextEditingController farmerNameController =
  TextEditingController(text: 'Vijay Kumar');
  final TextEditingController farmerAddressController =
  TextEditingController(text: 'Village XYZ, Uttar Pradesh');
  final TextEditingController buyerNameController = TextEditingController();
  final TextEditingController buyerAddressController = TextEditingController();
  final TextEditingController cropTypeController =
  TextEditingController(text: 'Wheat');
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController qualityGradeController = TextEditingController();
  final TextEditingController otherSpecificationsController =
  TextEditingController();
  final TextEditingController pricePerKgController =
  TextEditingController(text: '25');
  final TextEditingController totalPriceController = TextEditingController();
  final TextEditingController paymentScheduleController =
  TextEditingController();
  final TextEditingController deliveryDateController = TextEditingController();
  final TextEditingController deliveryLocationController =
  TextEditingController();
  final TextEditingController contractStartDateController =
  TextEditingController();
  final TextEditingController contractEndDateController =
  TextEditingController();
  final TextEditingController terminationClauseController =
  TextEditingController();
  final TextEditingController termsAndConditionsController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contract'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
                'Farmer Name', 'Enter farmer name', farmerNameController, true),
            _buildTextField('Farmer Address', 'Enter farmer address',
                farmerAddressController, true),
            _buildTextField(
                'Buyer Name', 'Enter buyer name', buyerNameController, false),
            _buildTextField('Buyer Address', 'Enter buyer address',
                buyerAddressController, false),
            _buildTextField(
                'Crop Type', 'Enter crop type', cropTypeController, true),
            _buildTextField('Quantity (in kilograms)', 'Enter quantity',
                quantityController, false),
            _buildTextField('Quality Grade', 'Enter quality grade',
                qualityGradeController, false),
            _buildTextField(
                'Other Specifications',
                'Enter other specifications',
                otherSpecificationsController,
                false),
            _buildTextField('Price per Kilogram', 'Enter price per kg',
                pricePerKgController, true),
            _buildTextField('Total Price', 'Enter total price',
                totalPriceController, false),
            _buildCheckBoxField(
                'Payment Method', ['Cash', 'Bank Transfer', 'Other']),
            _buildCheckBoxField(
                'Payment Schedule', ['Upon Delivery', 'Installments']),
            _buildTextField(
                'Payment Schedule Details',
                'Enter payment schedule details',
                paymentScheduleController,
                false),
            _buildCheckBoxField('Mode of Delivery',
                ['Direct to Buyer', 'Third-Party Transport']),
            _buildTextField('Delivery Date', 'Enter delivery date',
                deliveryDateController, false),
            _buildTextField('Delivery Location', 'Enter delivery location',
                deliveryLocationController, false),
            _buildTextField('Contract Start Date', 'Enter start date',
                contractStartDateController, false),
            _buildTextField('Contract End Date', 'Enter end date',
                contractEndDateController, false),
            _buildTextField('Termination Clause', 'Enter termination clause',
                terminationClauseController, false),
            SizedBox(height: 20),
            // Terms and Conditions with multi-line support
            _buildTextField(
              'Terms and Conditions',
              'Enter Terms and Conditions',
              termsAndConditionsController,
              false,
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => GeneratedContractPage()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryCol,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Submit',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build TextFields
  Widget _buildTextField(String label, String placeholder,
      TextEditingController controller, bool isReadOnly,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        readOnly: isReadOnly,
        maxLines: maxLines,
        decoration: InputDecoration(
          label: Text(label,style: TextStyle(color: Colors.grey.shade500),),
          hintText: placeholder,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.normal
          ),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryCol),
          )
        ),
      ),
    );
  }

  // Helper method to build checkboxes for selection options
  Widget _buildCheckBoxField(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Column(
          children: options.map((option) {
            return CheckboxListTile(
              title: Text(option),
              value: false,
              onChanged: (bool? value) {
                // Handle checkbox state change
              },
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}