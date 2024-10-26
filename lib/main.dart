import 'package:flutter/material.dart';
import 'package:loanapp/app_colors.dart';
import 'package:loanapp/bottomNavigation.dart';
import 'package:loanapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {                     
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? mobileNumber = prefs.getString('mobileNumber');
   // ignore: non_constant_identifier_names
   String? Usertoken = prefs.getString('Usertoken');

  runApp(MyApp(mobileNumber: mobileNumber, Usertoken: Usertoken));
}

class MyApp extends StatelessWidget {
  final String? mobileNumber;
  // ignore: non_constant_identifier_names
  final String? Usertoken;

  // ignore: use_key_in_widget_constructors, non_constant_identifier_names
  const MyApp({this.mobileNumber, this.Usertoken});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loan app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginApp(),
        '/login': (context) => const LoginApp(),
        '/dashboard': (context) => const DashboardPage(index: 0),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(), // Create a NotFoundPage widget to handle unknown routes
        );
      },
    );
  }
}

// ignore: use_key_in_widget_constructors
class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page Not Found'),
      ),
    );
  }
}