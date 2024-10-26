import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:loanapp/app_urls.dart';
// ignore: unused_import
import 'package:loanapp/forgotpassword.dart';
import 'package:loanapp/resetsuccessfull.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types


// ignore: camel_case_types
class newpassword1 extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const newpassword1({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _newpassword1State createState() => _newpassword1State();
}

class _newpassword1State extends State<newpassword1> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Image.asset('assets/images/Picture1.png', height: 250),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set new password',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'FontMain4'),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Set new login password for your account',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: 'FontMain4'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    style: const TextStyle(fontFamily: 'FontMain4'), // Change font family for text inside text field
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _repeatPasswordController,
                    obscureText: !_isRepeatPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Repeat Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isRepeatPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isRepeatPasswordVisible = !_isRepeatPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please repeat your password';
                      } else if (value != _newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    style: const TextStyle(fontFamily: 'FontMain4'), // Change font family for text inside text field
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'FontMain4'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      // String mobileNumber = _mobileNumberController.text;
   
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const resetSuccessfull1()),
        );
    }
  }
      }
  
