// ignore_for_file: sized_box_for_whitespace
import 'dart:async';

import 'package:loanapp/bottomNavigation.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loanapp/app_colors.dart';
import 'package:loanapp/app_urls.dart';
// ignore: unused_import
import 'package:loanapp/Leads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // ignore: non_constant_identifier_names
    String? user_name = 'User';
bool showShimmer = true;
  late Timer _shimmerTimer;

  @override
  void initState() {
    super.initState();
    _initializeShimmer();
    _checkLogin();
    _fetchUsername(context);
  }

  void _initializeShimmer() {
    _shimmerTimer = Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          showShimmer = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _shimmerTimer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  
Future<void> _checkLogin() async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
  String? mobileNumber = prefs.getString('mobileNumber');
  String? Usertoken = prefs.getString('Usertoken');
  if(mobileNumber == null && Usertoken == null){
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
  }
    Future<void> _fetchUsername(BuildContext context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // // ignore: non_constant_identifier_names
    // String? Usertoken = prefs.getString('Usertoken');
    //  String? mobileNumber = prefs.getString('mobileNumber');
    //   String? password = prefs.getString('password');
    // const url = '${AppUrls.mainURL}login/profile';
    // final headers = <String, String>{
    //   'Authorization': '$Usertoken',
    // };
    // final body = jsonEncode({
    //   'userMobileNumber': '$mobileNumber', // Replace with your API parameters
    //   'userPassword': '$password',
    // });
  
    // try {
    //   final response = await http.post(
    //     Uri.parse(url),
    //     headers: headers,
    //     body: body,
    //   );

    //   if (response.statusCode == 201) {
    //     final responseData = json.decode(response.body);
    //     int status = responseData['status'];
    //     if (status == 200) {
    //   if(mounted){
    //       setState(() {
    //         user_name = responseData['data']['user']['userFullName'];
    //       });
    //   }
    
    //     } else {
    //       // Handle error status
    //     }
    //   } else {
    //     // Handle non-200 status code
    //   }
    // } catch (e) {
    //   // Handle network errors
    // }
  
  }
   Future<void> _refresh() async {
    // Simulate a network call or other async operations
  _fetchUsername(context);

  }

  







  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: const Color(0xFF5854D3),
    ));
    return Scaffold(
      backgroundColor: Colors.grey[200],
        key: _scaffoldKey,
      body: RefreshIndicator(
        onRefresh: _refresh,
         color:  const Color(0xFF5854D3), // Customize the indicator color
        backgroundColor: Colors.white, // Customize the background color
        strokeWidth: 3.0, 
         child: SingleChildScrollView(
           physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children :[ Container(
                  height: 840,
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      user_name == null
        ? Shimmer.fromColors(
            baseColor: Color(0xFF5854D3),
            highlightColor: Color(0xFF5854D3),
            child: Container(
              height: 300.0,
              decoration: const BoxDecoration(
                color: Color(0xFF5854D3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu,
                              color: Colors.white, size: 30.0),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications_active_outlined,
                              color: Colors.white, size: 30.0),
                          onPressed: () {
                            // Handle the notification button press
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Container(
                        width: 200,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            height: 300.0,
            decoration: const BoxDecoration(
              color: Color(0xFF5854D3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu,
                            color: Colors.white, size: 30.0),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_active_outlined,
                            color: Colors.white, size: 30.0),
                        onPressed: () {
                          // Handle the notification button press
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: user_name == null
                        ? Text(
                            'Hello $user_name',
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontFamily: 'FontMain4'),
                          )
                        : Text(
                            'Hello $user_name',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'FontMain4'),
                          ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: user_name == null
                        ? const Text(
                            'Welcome to Loan app',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'FontMain4'),
                          )
                        : const Text(
                            'Welcome to Loan app',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'FontMain4'),
                          ),
                  ),
                ],
              ),
            ),
          ),
                     const SizedBox(height: 120,),
                      const Padding(
                        padding: EdgeInsets.only(right: 110),
                        child: Text(
                          'Quick Links',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,fontFamily: 'FontMain4'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                           Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: GestureDetector(
                                onTap: () {  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardPage(index: 1,)),
                    ); },
                                child: Container(
                                 width: 120.0,
                                 height: 80.0,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: const Color.fromARGB(215, 234, 157, 143),
                                 ),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items vertically
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                                       child: Column(
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align text and icon horizontally
                                             children: [
                                              
                                               const Icon(
                                                 Icons.library_add_check_outlined, // Replace 'your_icon' with the icon you want to use
                                                 color: Colors.black,
                                               ),
                                               Container()
                                             ],
                                           ),
                                           const SizedBox(height: 5.0), 
                                            const Text(
                                             'Leads',
                                             style: TextStyle(
                                               color: Colors.black,
                                               fontSize: 14.0,
                                               fontWeight: FontWeight.bold
                                               ,fontFamily: 'FontMain4'
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                     const SizedBox(height: 8.0), // Add some space between text and container border
                                   ],
                                 ),
                               ),
                             ),
                           ),
                        
                            Container(
                              width: 120.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(197, 142, 168, 145),
                              ),
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items vertically
                             children: [
                                Padding(
                            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                             child: Column(
                                children: [
                              Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align text and icon horizontally
                               children: [
                                const Icon(
                          Icons.library_add_check_outlined, // Replace 'your_icon' with the icon you want to use
                          color: Colors.black,
                        ),
                        Container()
                      ],
                    ),
                     SizedBox(height: 15,),
                     const Text(
                      'Applications',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,fontFamily: 'FontMain4'
                      ),
                    ),
                  ],
                                ),
                        ),
                        const SizedBox(height: 8.0), // Add some space between text and container border
                  ],),),
                  Container(
                              width: 120.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(202, 143, 188, 201),
                              ),
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items vertically
                  children: [
                        Padding(
                                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align text and icon horizontally
                      children: [
                       
                        const Icon(
                          Icons.update, // Replace 'your_icon' with the icon you want to use
                          color: Colors.black,
                        ),
                        Container()
                      ],
                    ),
                    const SizedBox(height: 15,),
                     const Text(
                      'Update Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,fontFamily: 'FontMain4'
                      ),
                    ),
                  ],
                                ),
                        ),
                        const SizedBox(height: 8.0), // Add some space between text and container border
                  ],
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 120.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(224, 187, 198, 239),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items vertically
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align text and icon horizontally
                                            children: [
                                             
                                              const Icon(
                                                Icons.new_label, // Replace 'your_icon' with the icon you want to use
                                                color: Colors.black,
                                              ),
                                              Container()
                                            ],
                                          ),
                                            const SizedBox(height: 5.0),
                                           const Text(
                                            'New Lead',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,fontFamily: 'FontMain4'
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8.0), // Add some space between text and container border
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                   Positioned(
                      top: 180, // Adjust this value as needed to place the container correctly
                      left: 20,
                      right: 20,
                      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              width: 280,
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: showShimmer
                  ? _buildShimmer() // Show shimmer if needed
                  : _buildContent(), // Show content when shimmer is hidden
            ),
          ),
        ],
      ),
                      
                )
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Welcome, $user_name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.black),
                title: Text('Home', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.leaderboard, color: Colors.black),
                title: Text('Leads', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.stay_current_landscape_sharp, color: Colors.black),
                title: Text('Applications', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
               ListTile(
                leading: Icon(Icons.update, color: Colors.black),
                title: const Text('Update Profile', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildShimmer() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusted alignment
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted alignment
              children: [
                _buildShimmerItem(),
                Container(
                  width: 1.5,
                  color: Colors.black,
                ),
                _buildShimmerItem(),
              ],
            ),
          ),
          Container(
            height: 1.5,
            width: 200,
            color: Colors.black,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted alignment
              children: [
                _buildShimmerItem(),
                Container(
                  width: 1.5,
                  color: Colors.black,
                ),
                _buildShimmerItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey[300],
          ),
          SizedBox(height: 5),
          Container(
            width: 40,
            height: 40,
            color: Colors.grey[300],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildContent() {
    // Your original content goes here
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusted alignment
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted alignment
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New Leads',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'FontMain4',
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        const Text(
                          '25',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'FontMain4'),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                width: 1.5,
                color: Colors.black,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'In Progress',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'FontMain4',
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        const Text(
                          '15',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'FontMain4'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.5,
          width: 200,
          color: Colors.black,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted alignment
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Cancelled',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'FontMain4',
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        const Text(
                          '11',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'FontMain4'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.5,
                color: Colors.black,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Converted',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'FontMain4',
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        const Text(
                          '13',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'FontMain4'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
