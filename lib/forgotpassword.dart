import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_toast/motion_toast.dart';
// ignore: unused_import
import 'package:loanapp/app_colors.dart';
import 'package:loanapp/app_urls.dart';
// ignore: unused_import
import 'package:loanapp/forgotpassword.dart';
import 'package:loanapp/otp_verification.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ForgotPasswordScreen1 extends StatefulWidget {
  const ForgotPasswordScreen1({Key? key});

  @override
  _ForgotPasswordScreen1State createState() => _ForgotPasswordScreen1State();
}

class _ForgotPasswordScreen1State extends State<ForgotPasswordScreen1> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_field, prefer_final_fields
  bool _isPasswordVisible = false;


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
                          'Forgot Passowrd',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'FontMain4'),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Please enter your details',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: 'FontMain4'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _mobileNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Enter Mobile Number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      } else if (value.length != 10) {
                        return 'Please enter a valid mobile number';
                      }
    
                      return null;
                    },
                    style: const TextStyle(fontFamily: 'FontMain4'), // Change font family for text inside text field
                  ),
                  const SizedBox(height: 20),
                  
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('6 Digit OTP will be sent to your registered mobile number to verify your details.' ,  style: TextStyle(fontSize:12, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: 'FontMain4'),),
                    
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
      if (_formKey.currentState!.validate()) {
      String mobileNumber = _mobileNumberController.text;
  
 
        
        // ignore: use_build_context_synchronously
        Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => const OtpVerification1()),
                      );
   
    
    
    }
                      
                      },
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

  void _login() {
    if (_formKey.currentState!.validate()) {
      String mobileNumber = _mobileNumberController.text;
      String password = _passwordController.text;
      print('Mobile Number: $mobileNumber');
      print('Password: $password');
    }
  }
}


