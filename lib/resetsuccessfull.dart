// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: duplicate_ignore
// ignore: unused_import
import 'package:loanapp/login.dart';
import 'package:loanapp/newpassword.dart';



class resetSuccessfull1 extends StatefulWidget {
  const resetSuccessfull1({Key? key});

  @override
  _resetSuccessfull1State createState() => _resetSuccessfull1State();
}

class _resetSuccessfull1State extends State<resetSuccessfull1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Reset Successful',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'FontMain4',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset('assets/images/successful.png', height: 250),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: Text(
                        'Your new password is set successfully. Please login again with your new password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: 'FontMain4',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 150), // Added extra space before the button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _navigateToLogin,
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'FontMain4',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToLogin() {
     Navigator.of(context).pushNamedAndRemoveUntil('/',(Route<dynamic> route) =>false);
  }
}
