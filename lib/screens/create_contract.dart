import 'package:flutter/material.dart';

Color primaryCol = const Color(0xFF33A864);

class ContractForm extends StatefulWidget {
  @override
  _ContractFormState createState() => _ContractFormState();
}

class _ContractFormState extends State<ContractForm> {
  final _formKey = GlobalKey<FormState>();

  String _cropCategory = 'Grains';
  String _month = 'January';
  String _crop = '';
  String _quantity = '';
  String _minOrderQuantity = '';
  String _price = '';
  String _deliveryDate = '';

  String? _selectedPaymentMethod = 'Bank Transfer';

  DateTime _selectedDate = DateTime.now();

  List<String> cropCategories = [
    'Grains',
    'Vegetables',
    'Fruits',
    'Spices',
    'Livestock',
    'Aquaculture',
    'Medicinal',
    'Fibers',
    'Beverages',
    'Dairy',
    'Oilseeds',
    'Nuts',
  ];

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  Map<String, List<String>> cropOptions = {
    'Grains': [
      'Wheat',
      'Rice',
      'Barley',
      'Oats',
      'Corn',
      'Sorghum',
      'Millet',
      'Rye',
      'Quinoa',
      'Buckwheat'
    ],
    'Vegetables': [
      'Potato',
      'Tomato',
      'Carrot',
      'Broccoli',
      'Spinach',
      'Cucumber',
      'Pepper',
      'Onion',
      'Cauliflower',
      'Lettuce'
    ],
    'Fruits': [
      'Mango',
      'Apple',
      'Banana',
      'Orange',
      'Grapes',
      'Pineapple',
      'Strawberry',
      'Blueberry',
      'Pomegranate',
      'Peach'
    ],
    'Spices': [
      'Chili',
      'Turmeric',
      'Coriander',
      'Cumin',
      'Cardamom',
      'Cloves',
      'Black Pepper',
      'Mustard',
      'Ginger',
      'Nutmeg'
    ],
    'Livestock': [
      'Cattle',
      'Sheep',
      'Goat',
      'Pigs',
      'Chicken',
      'Turkey',
      'Duck',
      'Horse',
      'Rabbit',
      'Alpaca'
    ],
    'Aquaculture': [
      'Salmon',
      'Prawns',
      'Catfish',
      'Shrimp',
      'Oysters',
      'Mussels',
      'Crab'
    ],
    'Medicinal': [
      'Aloe Vera',
      'Ginseng',
      'Lavender',
      'Echinacea',
      'Peppermint',
      'Ginger',
      'Turmeric',
      'Chamomile',
      'Garlic',
      'Valerian Root'
    ],
    'Fibers': [
      'Cotton',
      'Jute',
      'Hemp',
      'Flax',
      'Silk',
      'Wool',
      'Bamboo',
      'Ramie',
      'Kenaf',
      'Sisal'
    ],
    'Beverages': [
      'Coffee',
      'Tea',
      'Cocoa',
      'Juice',
      'Wine',
      'Beer',
      'Lemonade',
      'Smoothie',
      'Herbal Tea',
      'Soda'
    ],
    'Dairy': [
      'Milk',
      'Cheese',
      'Yogurt',
      'Butter',
      'Cream',
      'Kefir',
      'Cottage Cheese',
      'Buttermilk',
      'Sour Cream',
      'Ghee'
    ],
    'Oilseeds': [
      'Soybean',
      'Sunflower',
      'Canola',
      'Peanut',
      'Flaxseed',
      'Sesame',
      'Safflower',
      'Pumpkin Seed',
      'Hemp Seed',
      'Mustard Seed'
    ],
    'Nuts': [
      'Almond',
      'Walnut',
      'Cashew',
      'Pistachio',
      'Hazelnut',
      'Brazil Nut',
      'Macadamia',
      'Pine Nut',
      'Chestnut',
      'Pecan'
    ]
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop Details',
                  style: TextStyle(
                    fontSize: 22,
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

                _buildDropdown(
                  label: 'Month of Harvest',
                  value: _month,
                  items: months,
                  onChanged: (String? newValue) {
                    setState(() {
                      _month = newValue!;
                    });
                  },
                ),
                SizedBox(height: 30),

                Text(
                  'Quantity and Price Details',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                _buildTextField(
                  label: 'Quantity (kg)',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _quantity = value!,
                ),
                SizedBox(height: 20),

                _buildTextField(
                  label: 'Minimum Order Quantity (in kg)',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _minOrderQuantity = value!,
                ),
                SizedBox(height: 20),

                _buildTextField(
                  label: 'Price per kg (₹)',
                  keyboardType: TextInputType.datetime,
                  onSaved: (value) => _price = value!,
                ),
                SizedBox(height: 30),

                Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Choose Payment Method:',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),

                      // Bank Transfer
                      ListTile(
                        title: const Text('Bank Transfer'),
                        leading: Radio<String>(
                          value: 'Bank Transfer',
                          activeColor: primaryCol,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                      ),

                      // Cash
                      ListTile(
                        title: const Text('Cash'),
                        leading: Radio<String>(
                          value: 'Cash',
                          activeColor: primaryCol,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                      ),

                      // UPI
                      ListTile(
                        title: const Text('UPI'),
                        leading: Radio<String>(
                          value: 'UPI',
                          activeColor: primaryCol,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

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
                      'Post Details',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20,)
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
            200,
        icon: Icon(Icons.arrow_drop_down),
      ),
    );
  }

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
