import 'package:flutter/material.dart';
import 'create_contract.dart';
Color primaryCol = const Color(0xFF33A864);

class SellerHomePage extends StatefulWidget {
  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
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
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset('assets/app_logo.png', height: 40),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
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
            SizedBox(height: 40),
            //tutorial videos
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Watch Tutorial Videos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200, // Set the height of the container
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // Scroll horizontally
                    child: Row(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Implement action on video tap
                              print('Play video $index');
                            },
                            child: Container(
                              width: 300, // Set width for each video card
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_circle_outline, size: 80, color: Colors.grey.shade600),
                                  SizedBox(height: 10),
                                  Text(
                                    'Tutorial Video ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              "Need Help?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contact Support (24x7)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  Icon(
                    Icons.headset_mic,
                    size: 25,
                    color: Colors.white,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: primaryCol,
                borderRadius: BorderRadius.circular(10),
              ),

            ),

            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Talk to an expert",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  Icon(
                    Icons.phone_in_talk,
                    size: 25,
                    color: Colors.white,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: primaryCol,
                borderRadius: BorderRadius.circular(10),
              ),

            ),

            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "App guide",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  Icon(
                    Icons.info,
                    size: 25,
                    color: Colors.white,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: primaryCol,
                borderRadius: BorderRadius.circular(10),
              ),

            ),

            SizedBox(height: 65),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/contractForm');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: primaryCol,
            width: 6
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        icon: Icon(Icons.add,size: 30,),
        label: Text(
            'Create',
            style: TextStyle(
              fontSize: 22,
            ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                              'Wasee',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '+91 7777777777',
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
                        '2.5',
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
                        '12',
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