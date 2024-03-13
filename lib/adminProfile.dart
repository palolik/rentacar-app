import 'package:flutter/material.dart';
import 'package:rent_my_ride_s1/adminLogin.dart';
import 'package:rent_my_ride_s1/utils/constant.dart';
// Import the admin login page file

class ProfilePage1 extends StatelessWidget {
  final String userName;
  final String userEmail;

  ProfilePage1({required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile1'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.jpg',
              width: 270,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome Dear Admin',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Rayhan'),
              subtitle: Text(userName),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('rayhan@gmail.com'),
              subtitle: Text(userEmail),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                );
              },
              child: const Text('Logout'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
