import 'package:flutter/material.dart';

Color primaryCol = const Color(0xFF33A864);

class ContractForm extends StatefulWidget {
  @override
  _ContractFormState createState() => _ContractFormState();
}

class _ContractFormState extends State<ContractForm> {
  final _formKey = GlobalKey<FormState>();

  String _cropCategory = 'Grains';
  String _crop = '';
  String _quantity = '';
  String _price = '';
  String _deliveryDate = '';

  List<String> cropCategories = ['Grains', 'Vegetables', 'Fruits', 'Spices'];
  Map<String, List<String>> cropOptions = {
    'Grains': ['Wheat', 'Rice', 'Barley'],
    'Vegetables': ['Potato', 'Tomato', 'Carrot'],
    'Fruits': ['Mango', 'Apple', 'Banana'],
    'Spices': ['Chili', 'Turmeric', 'Coriander']
  };

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Submit the contract terms
      print(
          'Contract Details: Crop Category: $_cropCategory, Crop: $_crop, Quantity: $_quantity, Price: $_price, Delivery Date: $_deliveryDate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Define Contract'),
        backgroundColor: Colors.white,
        elevation: 8,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Contract Details',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // Crop Category Dropdown
                _buildDropdown(
                  label: 'Crop Category',
                  value: _cropCategory,
                  items: cropCategories,
                  onChanged: (String? newValue) {
                    setState(() {
                      _cropCategory = newValue!;
                      _crop = ''; // Reset crop when category changes
                    });
                  },
                ),
                SizedBox(height: 20),

                // Crop Dropdown
                _buildDropdown(
                  label: 'Select Crop',
                  value: _crop.isEmpty ? null : _crop,
                  items: cropOptions[_cropCategory]!,
                  onChanged: (String? newValue) {
                    setState(() {
                      _crop = newValue!;
                    });
                  },
                ),
                SizedBox(height: 20),

                // Quantity Text Field
                _buildTextField(
                  label: 'Quantity (kg)',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _quantity = value!,
                ),
                SizedBox(height: 20),

                // Price Text Field
                _buildTextField(
                  label: 'Price per kg (₹)',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _price = value!,
                ),
                SizedBox(height: 20),

                // Delivery Date Text Field
                _buildTextField(
                  label: 'Delivery Date',
                  keyboardType: TextInputType.datetime,
                  onSaved: (value) => _deliveryDate = value!,
                ),
                SizedBox(height: 40),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryCol,
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 80.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 10,
                    ),
                    child: Text(
                      'Submit Contract',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper to build dropdowns with consistent styling
  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF33A864)),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        value: value,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  // Helper to build text fields with consistent styling
  Widget _buildTextField({
    required String label,
    required TextInputType keyboardType,
    required FormFieldSetter<String> onSaved,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF33A864)),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
