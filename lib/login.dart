import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loanapp/app_urls.dart';
import 'package:loanapp/bottomNavigation.dart';
import 'package:loanapp/forgotpassword.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const LoginApp({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white,
    ));
    return MaterialApp(
      title: 'Loan app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          // Change font family for text inside text fields
          labelStyle: const TextStyle(fontFamily: 'FontMain4'),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            textStyle: const TextStyle(fontSize: 18),
            backgroundColor: const Color(0xFF5854D3),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(189, 113, 113, 113),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      
       initialRoute: '/',
       routes: {
         '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(index: 0,),
    
    },
    );
  }
}

class LoginPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginPage({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode(); // Added FocusNode for password field
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose(); // Dispose the FocusNode when not needed
    super.dispose();
  }

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
                          'Welcome',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'FontMain4'),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Sign in to continue',
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
                    style: const TextStyle(fontFamily: 'FontMain4'),
                    onChanged: (value) {
                      if (value.length == 10) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    focusNode: _passwordFocusNode, // Assign the FocusNode to the password field
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Enter Password',
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
                    style: const TextStyle(fontFamily: 'FontMain4'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen1()));
                    },
                    child: const Text('Forgot password?'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login,
                      child: const Text(
                        'Login',
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

void showCustomSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(Icons.check_circle, color: Colors.white),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.green, // Background color of the snackbar
    duration: const Duration(seconds: 3), // Display duration
    behavior: SnackBarBehavior.floating, // Floating snackbar style
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ), // Rounded corners
    margin: EdgeInsets.all(10), // Margin around the snackbar
    elevation: 6, // Elevation to make it stand out
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Padding inside the snackbar
    action: SnackBarAction(
      label: 'Close', // Action button label
      onPressed: () {
        if(mounted){
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } // Functionality to close the snackbar
      },
      textColor: Colors.white, // Action button text color
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

 Future<void> _setpreference(mobileNumber, password)async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
      // ignore: unused_local_variable
      var mobilenumber1 = await prefs.setString('mobileNumber', mobileNumber);
       await prefs.setString('password',password);
      
   }
   void showWarningSnackBar(BuildContext context, String title, String message) {
  final snackBar = SnackBar(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
    backgroundColor: Colors.black87, // Background color of the snackbar
    duration: Duration(seconds: 5), // Display duration
    behavior: SnackBarBehavior.floating, // Floating snackbar style
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ), // Rounded corners
    margin: EdgeInsets.all(10), // Margin around the snackbar
    elevation: 6, // Elevation to make it stand out
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Padding inside the snackbar
    action: SnackBarAction(
      label: 'Dismiss', // Action button label
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Functionality to close the snackbar
      },
      textColor: Colors.orange, // Action button text color
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
   
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      String mobileNumber = _mobileNumberController.text;
      String password = _passwordController.text;
      //  Navigator.push(
      //                   context,
      //                   MaterialPageRoute(builder: (context) => const DashboardPage()),
      //                 );

    //   const url = '${AppUrls.mainURL}login';
    // final response = await http.get(Uri.parse('$url?userMobileNumber=$mobileNumber&userPassword=$password'));
    
   
    
    // if (response.statusCode == 201) {
    //   final responseData = json.decode(response.body);
    //   int status = responseData['status'];
   
      
      // if (status != 200) {
        _setpreference(mobileNumber, password);
        if(mounted){
       showCustomSnackBar(context, 'succesfully logged in');} // Use responseData directly instead of decoding again
        
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('Usertoken', '1');
        
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/dashboard');
      // } else {
      //   // ignore: use_build_context_synchronously
      // if(mounted){
      //  showWarningSnackBar(context,'Opps', responseData['message']);}// Use responseData directly instead of decoding again
      // }
    // } else {
    //   // Handle other status codes if needed
    //   MotionToast.warning(
    //     title: const Text("Oops"), 
    //     description: const Text("Failed to log in. Please try again."), 
    //   // ignore: use_build_context_synchronously
    //   ).show(context);
    // }
    }
  }
}
