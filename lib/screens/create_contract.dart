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

  DateTime _selectedDate = DateTime.now();

  List<String> cropCategories = ['Grains', 'Vegetables', 'Fruits', 'Spices', 'Livestock', 'Aquaculture', 'Medicinal', 'Fibers', 'Beverages', 'Dairy','Oilseeds', 'Nuts',];

  Map<String, List<String>> cropOptions = {
    'Grains': ['Wheat', 'Rice', 'Barley', 'Oats', 'Corn', 'Sorghum', 'Millet', 'Rye', 'Quinoa', 'Buckwheat'],
    'Vegetables': ['Potato', 'Tomato', 'Carrot', 'Broccoli', 'Spinach', 'Cucumber', 'Pepper', 'Onion', 'Cauliflower', 'Lettuce'],
    'Fruits': ['Mango', 'Apple', 'Banana', 'Orange', 'Grapes', 'Pineapple', 'Strawberry', 'Blueberry', 'Pomegranate', 'Peach'],
    'Spices': ['Chili', 'Turmeric', 'Coriander', 'Cumin', 'Cardamom', 'Cloves', 'Black Pepper', 'Mustard', 'Ginger', 'Nutmeg'],
    'Livestock': ['Cattle', 'Sheep', 'Goat', 'Pigs', 'Chicken', 'Turkey', 'Duck', 'Horse', 'Rabbit', 'Alpaca'],
    'Aquaculture': ['Salmon', 'Prawns', 'Catfish', 'Shrimp', 'Oysters', 'Mussels', 'Crab'],
    'Medicinal': ['Aloe Vera', 'Ginseng', 'Lavender', 'Echinacea', 'Peppermint', 'Ginger', 'Turmeric', 'Chamomile', 'Garlic', 'Valerian Root'],
    'Fibers': ['Cotton', 'Jute', 'Hemp', 'Flax', 'Silk', 'Wool', 'Bamboo', 'Ramie', 'Kenaf', 'Sisal'],
    'Beverages': ['Coffee', 'Tea', 'Cocoa', 'Juice', 'Wine', 'Beer', 'Lemonade', 'Smoothie', 'Herbal Tea', 'Soda'],
    'Dairy': ['Milk', 'Cheese', 'Yogurt', 'Butter', 'Cream', 'Kefir', 'Cottage Cheese', 'Buttermilk', 'Sour Cream', 'Ghee'],
    'Oilseeds': ['Soybean', 'Sunflower', 'Canola', 'Peanut', 'Flaxseed', 'Sesame', 'Safflower', 'Pumpkin Seed', 'Hemp Seed', 'Mustard Seed'],
    'Nuts': ['Almond', 'Walnut', 'Cashew', 'Pistachio', 'Hazelnut', 'Brazil Nut', 'Macadamia', 'Pine Nut', 'Chestnut', 'Pecan']
  };


  // Function to handle date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

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
                  keyboardType: TextInputType.datetime,
                  onSaved: (value) => _price = value!,
                ),
                SizedBox(height: 20),

                // Delivery Date Picker
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF33A864), width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select date: ${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                        Icon(Icons.calendar_today, color: Color(0xFF33A864)),
                      ],
                    ),
                  ),
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

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    double? dropdownWidth, // Custom width for dropdown menu
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
        value: value ?? items.first, // Set default value if value is null
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded:
            true, // Ensure text doesn't get truncated inside the dropdown
        menuMaxHeight:
            200, // Custom max height for the dropdown menu (scrollable)
        icon: Icon(Icons.arrow_drop_down),
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
