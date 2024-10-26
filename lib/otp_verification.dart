import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:loanapp/app_colors.dart';
import 'package:loanapp/app_urls.dart';
import 'package:loanapp/newpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';



class OtpVerification1 extends StatefulWidget {
  const OtpVerification1({Key? key});

  @override
  _OtpVerification1State createState() => _OtpVerification1State();
}

class _OtpVerification1State extends State<OtpVerification1> {
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

   Future<bool> _showConfirmationBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: AppColors.secondaryColor,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ListTile(
                title: Center(
                  child: Text(
                    'Are you sure you want to exit the recording?',
                    style: TextStyle(
                      fontFamily: 'FontMain4',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true); // Close the bottom sheet
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false); // Pop with false indicating cancellation
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: const Text('No', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'NOTE: Once you exit the screen, the recorded session will not be available without submitting the recording.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey, // Adjusting text color
                  fontSize: 12, // Adjusting text size
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: WillPopScope(
      onWillPop: () async {
          final bool? result = await _showConfirmationBottomSheet(context);
          return result ?? false; // Prevent default back button behavior based on user choice
      },
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
                        'Enter Verification Code',
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'FontMain4'),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Image.asset('assets/images/verification.png', height: 250),
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            'Kindly input the 6-digit code we have \n sent to you at  +91 - 7756873424',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: 'FontMain4'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 40,
                            child: TextFormField(
                              controller: _otpControllers[index],
                              focusNode: _focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  if (index < 5) {
                                    FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                                  } else {
                                    FocusScope.of(context).unfocus();
                                  }
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ' ';
                                }
                                return null;
                              },
                              style: const TextStyle(fontFamily: 'FontMain4', fontSize: 24),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Didn’t receive the code?',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, fontFamily: 'FontMain4'),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Resend OTP code logic here
                        },
                        child: const Text(
                          'Resend Code',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF5854D3), fontFamily: 'FontMain4'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _verifyOtp,
                          child: const Text(
                            'Verify',
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
        ),
    );
  }

  Future<void> _verifyOtp() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid (all fields are filled), perform OTP verification
    
      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => const newpassword1()),
                      );

    }
  }
}
