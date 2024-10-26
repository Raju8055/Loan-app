// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class fourthscreen extends StatelessWidget {
  const fourthscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Welcome to the 4th Page!',
              style: TextStyle(fontSize: 24),
            ),
          ),
         InkWell(
 onTap: () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('mobileNumber');
  await prefs.remove('Usertoken');
  // ignore: use_build_context_synchronously
  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
},

  child: Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.blue, // Change the color as per your preference
      borderRadius: BorderRadius.circular(5), // Adjust border radius as needed
    ),
    child: const Text(
      'Logout',
      style: TextStyle(
        color: Colors.white, // Change text color as per your preference
        fontSize: 16, // Adjust font size as needed
      ),
    ),
  ),
),
  ],
      ),
     
    );
  }
}
