import 'package:flutter/material.dart';
import 'package:quiz_app/pages/login_page.dart';
import 'login_page.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = 'John Doe';
  String _userEmail = 'johndoe@example.com';
  String _userMobile = '+1 123-456-7890';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Quiz App'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage('assets/profile.jpg'), // Replace this with the actual profile picture
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    _userName,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _userEmail,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    _userMobile,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // TODO: Implement contact us functionality or navigate to the contact us page.
                Navigator.pop(context); // Close the drawer after selecting an option
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                // TODO: Implement about us functionality or navigate to the about us page.
                Navigator.pop(context); // Close the drawer after selecting an option
              },
            ),
              ListTile(
              leading: Icon(Icons.info),
              title: Text('Log Out'),
              onTap: () {
                // TODO: Implement about us functionality or navigate to the about us page.
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: TabNavigationPage(),
      ),
    );
  }
}
