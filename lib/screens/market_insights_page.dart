import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sure_crop/screens/create_contract.dart'; // For date formatting

class MarketInsightsPage extends StatefulWidget {
  @override
  _MarketInsightsPageState createState() => _MarketInsightsPageState();
}

class _MarketInsightsPageState extends State<MarketInsightsPage> {
  // The total number of rows to display initially and when expanded
  final int _initialRowsToShow = 10;
  final int _totalRows = 100;

  // Track whether the "Show More" button has been clicked
  bool _showAll = false;

  // Sample data for crops
  List<Map<String, String>> _cropData = [
    {'crop': 'Wheat', 'price': '₹50', 'change': '2.5%'},
    {'crop': 'Rice', 'price': '₹60', 'change': '-1.2%'},
    {'crop': 'Corn', 'price': '₹55', 'change': '3.0%'},
    {'crop': 'Barley', 'price': '₹45', 'change': '1.8%'},
    {'crop': 'Oats', 'price': '₹70', 'change': '2.1%'},
    {'crop': 'Soybean', 'price': '₹80', 'change': '-0.5%'},
    {'crop': 'Sugarcane', 'price': '₹65', 'change': '4.0%'},
    {'crop': 'Cotton', 'price': '₹75', 'change': '-2.0%'},
    {'crop': 'Sunflower', 'price': '₹90', 'change': '3.5%'},
    {'crop': 'Canola', 'price': '₹85', 'change': '2.7%'},
    {'crop': 'Tomato', 'price': '₹100', 'change': '-1.0%'},
    {'crop': 'Potato', 'price': '₹40', 'change': '1.5%'},
    {'crop': 'Onion', 'price': '₹50', 'change': '-0.8%'},
    {'crop': 'Carrot', 'price': '₹70', 'change': '2.2%'},
    {'crop': 'Cucumber', 'price': '₹60', 'change': '-1.5%'},
    {'crop': 'Pea', 'price': '₹55', 'change': '2.0%'},
    {'crop': 'Lettuce', 'price': '₹65', 'change': '-1.0%'},
    {'crop': 'Spinach', 'price': '₹75', 'change': '3.0%'},
    {'crop': 'Chili', 'price': '₹80', 'change': '-0.5%'},
    {'crop': 'Garlic', 'price': '₹90', 'change': '2.8%'},
    {'crop': 'Ginger', 'price': '₹85', 'change': '-1.2%'},
    {'crop': 'Cabbage', 'price': '₹45', 'change': '1.5%'},
    {'crop': 'Cauliflower', 'price': '₹55', 'change': '-0.8%'},
    {'crop': 'Broccoli', 'price': '₹70', 'change': '2.5%'},
    {'crop': 'Bell Pepper', 'price': '₹80', 'change': '-1.0%'},
    {'crop': 'Eggplant', 'price': '₹60', 'change': '3.0%'},
    {'crop': 'Pumpkin', 'price': '₹65', 'change': '-1.5%'},
    {'crop': 'Zucchini', 'price': '₹75', 'change': '2.0%'},
    {'crop': 'Sweet Corn', 'price': '₹85', 'change': '-0.5%'},
    {'crop': 'Mango', 'price': '₹120', 'change': '4.0%'},
    {'crop': 'Apple', 'price': '₹150', 'change': '-2.0%'},
    {'crop': 'Banana', 'price': '₹60', 'change': '1.8%'},
    {'crop': 'Orange', 'price': '₹80', 'change': '-1.0%'},
    {'crop': 'Grapes', 'price': '₹100', 'change': '2.5%'},
    {'crop': 'Pineapple', 'price': '₹110', 'change': '-0.5%'},
    {'crop': 'Papaya', 'price': '₹90', 'change': '3.0%'},
    {'crop': 'Watermelon', 'price': '₹70', 'change': '-1.2%'},
    {'crop': 'Kiwi', 'price': '₹120', 'change': '4.5%'},
    {'crop': 'Peach', 'price': '₹100', 'change': '-1.0%'},
    {'crop': 'Plum', 'price': '₹110', 'change': '2.2%'},
    {'crop': 'Cherry', 'price': '₹150', 'change': '-2.5%'},
    {'crop': 'Avocado', 'price': '₹200', 'change': '3.5%'},
    {'crop': 'Olive', 'price': '₹250', 'change': '-1.0%'},
    {'crop': 'Almond', 'price': '₹350', 'change': '2.0%'},
    {'crop': 'Cashew', 'price': '₹400', 'change': '-2.0%'},
    {'crop': 'Walnut', 'price': '₹450', 'change': '1.5%'},
    {'crop': 'Pistachio', 'price': '₹500', 'change': '-1.5%'},
    {'crop': 'Hazelnut', 'price': '₹550', 'change': '2.8%'},
    {'crop': 'Flaxseed', 'price': '₹300', 'change': '-0.5%'},
    {'crop': 'Chia Seed', 'price': '₹350', 'change': '3.0%'},
    {'crop': 'Sunflower Seed', 'price': '₹250', 'change': '-1.0%'},
    {'crop': 'Pumpkin Seed', 'price': '₹280', 'change': '2.5%'},
    {'crop': 'Sesame Seed', 'price': '₹320', 'change': '-1.2%'},
    {'crop': 'Coconut', 'price': '₹70', 'change': '3.0%'},
    {'crop': 'Date', 'price': '₹120', 'change': '-0.5%'},
    {'crop': 'Fig', 'price': '₹150', 'change': '2.8%'},
    {'crop': 'Raisin', 'price': '₹180', 'change': '-1.0%'},
    {'crop': 'Apricot', 'price': '₹200', 'change': '3.5%'},
    {'crop': 'Date Palm', 'price': '₹250', 'change': '-2.0%'},
    {'crop': 'Mulberry', 'price': '₹100', 'change': '1.5%'},
    {'crop': 'Blackberry', 'price': '₹120', 'change': '-0.8%'},
    {'crop': 'Raspberry', 'price': '₹150', 'change': '2.0%'},
    {'crop': 'Goji Berry', 'price': '₹180', 'change': '-1.2%'},
    {'crop': 'Elderberry', 'price': '₹200', 'change': '3.0%'},
    {'crop': 'Cranberry', 'price': '₹220', 'change': '-1.5%'},
    {'crop': 'Lingonberry', 'price': '₹240', 'change': '2.5%'},
    {'crop': 'Pomegranate', 'price': '₹300', 'change': '-0.5%'},
    {'crop': 'Ginger Root', 'price': '₹90', 'change': '3.5%'},
    {'crop': 'Turmeric', 'price': '₹100', 'change': '-2.0%'},
    {'crop': 'Cardamom', 'price': '₹200', 'change': '1.5%'},
    {'crop': 'Cloves', 'price': '₹250', 'change': '-1.0%'},
    {'crop': 'Cinnamon', 'price': '₹300', 'change': '2.0%'},
    {'crop': 'Nutmeg', 'price': '₹350', 'change': '-1.5%'},
    {'crop': 'Saffron', 'price': '₹1000', 'change': '3.0%'},
    {'crop': 'Vanilla', 'price': '₹1200', 'change': '-2.0%'},
    {'crop': 'Rosemary', 'price': '₹150', 'change': '2.5%'},
    {'crop': 'Thyme', 'price': '₹170', 'change': '-1.0%'},
    {'crop': 'Basil', 'price': '₹200', 'change': '3.5%'},
    {'crop': 'Oregano', 'price': '₹220', 'change': '-1.5%'},
    {'crop': 'Mint', 'price': '₹100', 'change': '2.0%'},
    {'crop': 'Parsley', 'price': '₹120', 'change': '-0.8%'},
    {'crop': 'Cilantro', 'price': '₹150', 'change': '3.0%'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Market Now'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCurrentMarketPrices(),
            _buildTopPerformingCrops(),
            _buildUpcomingMarketEvents(),
            _buildUserTipsAndResources(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentMarketPrices() {
    // Determine the number of rows to show based on _showAll
    final rowsToShow = _showAll ? _cropData : _cropData.take(_initialRowsToShow).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Market Prices',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DataTable(
                columns: [
                  DataColumn(label: Text('Crop')),
                  DataColumn(label: Text('Price\n(kg)')),
                  DataColumn(label: Text('Change\n   (%)')),
                ],
                rows: rowsToShow.map((data) {
                  final change = double.parse(data['change']!.replaceAll('%', ''));
                  return DataRow(cells: [
                    DataCell(Text(data['crop']!)),
                    DataCell(Text(data['price']!)),
                    DataCell(
                      Text(
                        data['change']!,
                        style: TextStyle(
                          color: change >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
              if (!_showAll)
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _showAll = true;
                      });
                    },
                    child: Text('Show More',style: TextStyle(color: primaryCol),),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopPerformingCrops() {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Performing Crops',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DataTable(
                columns: [
                  DataColumn(label: Text('Crop'),),
                  DataColumn(label: Text('Avg\nProfit\n/kg')),
                  DataColumn(label: Text('Market\nDemand')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Wheat')),
                    DataCell(Text('₹20')),
                    DataCell(Text('High')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Rice')),
                    DataCell(Text('₹25')),
                    DataCell(Text('Medium')),
                  ]),

                  DataRow(cells: [
                    DataCell(Text('Corn')),
                    DataCell(Text('₹22')),
                    DataCell(Text('High')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Sugarcane')),
                    DataCell(Text('₹26')),
                    DataCell(Text('High')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Watermelon')),
                    DataCell(Text('₹35')),
                    DataCell(Text('Medium')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Sweet Potato')),
                    DataCell(Text('₹42')),
                    DataCell(Text('Medium')),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingMarketEvents() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Market Events',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildEventItem('Agricultural Expo 2024', '2024-10-05'),
              _buildEventItem('Seasonal Crop Fair', '2024-11-12'),
              _buildEventItem('Market Trends Seminar', '2024-12-01'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventItem(String title, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.event, color: Colors.green.shade700),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            DateFormat('yyyy-MM-dd').format(DateTime.parse(date)),
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTipsAndResources() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tips and Resources',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildTipItem(
                'Diversify Your Crops',
                'Planting a variety of crops can reduce risk and increase profitability. Consider diversifying your crop portfolio to mitigate potential losses from price fluctuations or environmental factors.',
              ),
              _buildTipItem(
                'Monitor Market Trends Regularly',
                'Stay updated with the latest market trends and price changes. Regular monitoring can help you make informed decisions on when to buy or sell your crops.',
              ),
              _buildTipItem(
                'Use Technology for Precision Farming',
                'Leverage technology and data analytics to optimize crop production and resource usage. Precision farming can improve efficiency and yield quality.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
