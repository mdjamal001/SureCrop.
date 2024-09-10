import 'package:flutter/material.dart';
Color primaryCol = const Color(0xFF33A864);

class BuyerHomePage extends StatefulWidget {
  @override
  _BuyerHomePageState createState() => _BuyerHomePageState();
}

class _BuyerHomePageState extends State<BuyerHomePage> {
  int _selectedIndex = 0;

  //list storing different pages
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedIndex], //Display selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        selectedItemColor: primaryCol,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryCol,
          child: Icon(Icons.mic),
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.green.shade800),
          onPressed: () {},
        ),
        title: Image.asset('assets/app_logo.png', height: 40),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/heroimage.png',
                fit: BoxFit.cover,
              )
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.description),
                      label: Text('My Contracts'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        backgroundColor: primaryCol,
                        foregroundColor: Colors.grey.shade200,
                        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                      ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.storefront),
                    label: Text('Market Now'),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        backgroundColor: primaryCol,
                        foregroundColor: Colors.grey.shade200,
                        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //Categories Section
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            CategoryGrid(),

            SizedBox(height: 20),
            //Popular and Trending Section
            Text(
              'Popular & Trending Contracts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
      );
  }
}

class CategoryGrid extends StatefulWidget {
  @override
  _CategoryGridState createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  //List of categories elements with rhe label and image path
  final List<Map<String, String>> categories = [
    {'name': 'Grains', 'image': 'assets/categories/grains.jpeg'},
    {'name': 'Fruits', 'image': 'assets/categories/fruits.jpeg'},
    {'name': 'Vegetables', 'image': 'assets/categories/vegetables.jpeg'},
    {'name': 'Livestock', 'image': 'assets/categories/livestock.jpeg'},
    {'name': 'Spices', 'image': 'assets/categories/spices.jpeg'},
    {'name': 'Nuts', 'image': 'assets/categories/nuts.jpeg'},
    {'name': 'Fiber Crops', 'image': 'assets/categories/fiber.jpeg'},
    {'name': 'Dairy', 'image': 'assets/categories/dairy.jpeg'},
    {'name': 'Aqua', 'image': 'assets/categories/fish.jpeg'},
    {'name': 'Beverages', 'image': 'assets/categories/beverages.jpeg'},
    {'name': 'Medicinal', 'image': 'assets/categories/medicinal.jpeg'},
    {'name': 'Oilseeds', 'image': 'assets/categories/oilseeds.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('Clicked on ${categories[index]['name']}');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print('Clicked on ${categories[index]['name']} image');
                        },
                        splashColor: Colors.black.withOpacity(0.9),
                        child: Image.asset(
                          categories[index]['image']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                categories[index]['name']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Search',style: TextStyle(color: Colors.white),),
          backgroundColor: primaryCol,
        ),
        body:Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
        ),
    );
  }
}

class HistoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Contract History',),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHistoryItem('Contract 1', 'Completed on 2024-09-01', '5 tons of wheat', 'assets/contract_image1.png'),
            _buildHistoryItem('Contract 2', 'Completed on 2024-08-25', '10 tons of rice', 'assets/contract_image2.png'),
            _buildHistoryItem('Contract 3', 'Completed on 2024-08-15', '3 tons of corn', 'assets/contract_image3.png'),
            _buildHistoryItem('Contract 4', 'Completed on 2024-07-30', '2 tons of soybeans', 'assets/contract_image4.png'),
            _buildHistoryItem('Contract 5', 'Completed on 2024-07-01', '8 tons of barley', 'assets/contract_image5.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String title, String date, String description, String imagePath) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.green.shade800),
        onTap: () {
          print('Clicked!!!!!');
        },
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //Profile Info Card
              Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person, size: 35,),
                        backgroundColor: Colors.grey.shade300,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mohan',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '+91 9999999999',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                        },
                        icon: Icon(Icons.edit, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Rating and Followers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Rating'),
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        '1.2K',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Dealings'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Option Cards
              _buildOptionCard(Icons.work, 'Manage Contracts',
                  'View and manage your contracts'),
              SizedBox(height: 6,),
              _buildOptionCard(
                  Icons.history, 'Activity', 'Check your recent activities'),
              SizedBox(height: 6,),
              _buildOptionCard(
                  Icons.settings, 'Preferences', 'Adjust your preferences'),
              SizedBox(height: 6,),
              _buildOptionCard(
                  Icons.language, 'App Language', 'Change the app language'),
              SizedBox(height: 6,),
              _buildOptionCard(
                  Icons.settings, 'Settings', 'Manage your account settings'),
              SizedBox(height: 6,),
              _buildOptionCard(
                  Icons.logout, 'Logout', 'Sign out from your account',
                  color: Colors.red),
              SizedBox(height: 6,),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildOptionCard(IconData icon, String title, String subtitle,
      {Color color = const Color(0xFF33B864)}) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Icon(icon, color: color, size: 25),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}