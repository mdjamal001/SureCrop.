import 'package:flutter/material.dart';
import 'package:sure_crop/screens/farmer_list_page.dart'; // Ensure to import the FarmerListPage

class CropListPage extends StatelessWidget {
  final String categoryName;
  final List<String> crops;

  // Example farmer data for each crop
  final Map<String, List<Map<String, String>>> farmerData = {
    'Wheat': [
      {'name': 'Ramu', 'rating': '4.5', 'price': '20'},
      {'name': 'Wasee', 'rating': '4.2', 'price': '22'},
      {'name': 'Shankar', 'rating': '4.8', 'price': '19'},
      {'name': 'Ramu', 'rating': '4.5', 'price': '20'},
      {'name': 'Wasee', 'rating': '4.2', 'price': '22'},
      {'name': 'Shankar', 'rating': '4.8', 'price': '19'},
      {'name': 'Ramu', 'rating': '4.5', 'price': '20'},
      {'name': 'Wasee', 'rating': '4.2', 'price': '22'},
      {'name': 'Shankar', 'rating': '4.8', 'price': '19'},
    ],
    'Rice': [
      {'name': 'Naveen', 'rating': '4.1', 'price': '32'},
      {'name': 'Abhishek', 'rating': '3.9', 'price': '28'},
      {'name': 'Yakaiah', 'rating': '4.7', 'price': '35'},
      {'name': 'Naveen', 'rating': '4.1', 'price': '32'},
      {'name': 'Abhishek', 'rating': '3.9', 'price': '28'},
      {'name': 'Yakaiah', 'rating': '4.7', 'price': '35'},
      {'name': 'Naveen', 'rating': '4.1', 'price': '32'},
      {'name': 'Abhishek', 'rating': '3.9', 'price': '28'},
      {'name': 'Yakaiah', 'rating': '4.7', 'price': '35'},
    ],
    // Add more farmer data for other crops
  };

  CropListPage({required this.categoryName, required this.crops});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(

        title: Text('$categoryName'),
      ),
      body: ListView.builder(
        itemCount: crops.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
                border: Border.all(
                  width: 1.5,
                ),
              ),
              child: ListTile(
                title: Text(
                  crops[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                ),
                onTap: () {
                  // Get the list of farmers for the selected crop
                  List<Map<String, String>> selectedFarmers =
                      farmerData[crops[index]] ?? [];

                  // Navigate to FarmerListPage, passing the selected farmers data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmerListPage(
                        cropName: crops[index],
                        farmers: selectedFarmers,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
