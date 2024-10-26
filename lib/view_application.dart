import 'package:flutter/material.dart';
import 'package:loanapp/app_colors.dart';
// ignore: unused_import
import 'package:loanapp/bottomNavigation.dart';
// ignore: unused_import
import 'package:loanapp/update_Leads.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class ApplicationView extends StatefulWidget {
  final String notification;

  // ignore: use_super_parameters
  const ApplicationView({Key? key, required this.notification}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ApplicationViewState createState() => _ApplicationViewState();

  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) => throw UnimplementedError();
}

class _ApplicationViewState extends State<ApplicationView> with SingleTickerProviderStateMixin {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  // ignore: prefer_typing_uninitialized_variables
  late String dropdownValue;
  TextEditingController fullNameController = TextEditingController(text: 'John Doe');
  TextEditingController createdDateController = TextEditingController(text: '01/10/2000');

  @override
  void initState() {
    super.initState();
    // ignore: unused_local_variable
    String dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         surfaceTintColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "SAMD 2245",
                  style: TextStyle(
                    fontFamily: 'FontMain4',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // Handle the notification button press
                      },
                    ),
                  ],
                ),
              ],
            ),
          
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
              trackColor: MaterialStateProperty.all(const Color.fromARGB(255, 240, 240, 240)),
              trackBorderColor: MaterialStateProperty.all(const Color.fromARGB(255, 200, 200, 200)),
              thumbColor: MaterialStateProperty.all(Colors.grey),
              thickness: MaterialStateProperty.all(8.0),
              radius: const Radius.circular(10),
              thumbVisibility: MaterialStateProperty.all(true),
              minThumbLength: 48,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
               Container(
      margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/card.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Primary Applicant',
                          style: TextStyle(
                            color: Color.fromRGBO(238, 207, 213, 1),
                            fontSize: 14,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Text(
                          'Full Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          'YASHODA H',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Text(
                          'Mobile Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color.fromRGBO(238, 207, 213, 1),
                            ),
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  child: const Icon(
                                    Icons.call,
                                    color: Color.fromRGBO(238, 207, 213, 1),
                                    size: 5,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '8861308362',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'FontMain4',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Text(
                          'City',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          'Hunsur, Mysuru',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Text tapped');
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'FontMain4',
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Text(
                          'Product',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          'Home Loan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Loan Amount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          'Rs. 1,00,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Tenure',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          '36 Months',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
                const SizedBox(height: 20),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
             const Text('Co-Applications',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'FontMain4',
                          ),
                        ),
             SizedBox(width: 10,),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black,
                        ),
                        height: 25,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Add New',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                ],) ,

                Container(
      margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/card2.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Co Application',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Text(
                          'Full Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          'YASHODA H',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Text(
                          'Mobile Number',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  child: const Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: 5,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '8861308362',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'FontMain4',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Text(
                          'City',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          'Hunsur, Mysuru',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Text tapped');
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.black ,
                              fontSize: 12,
                              fontFamily: 'FontMain4',
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Text(
                          'Product',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          'Home Loan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Loan Amount',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          'Rs. 1,00,000',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Tenure',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'FontMain3',
                          ),
                        ),
                        const Text(
                          '36 Months',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'FontMain4',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String dropdownValue = 'Item 1';
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(color: AppColors.primaryColor, width: 1.2), // Change border color to red
    ),
    color: Color.fromARGB(98, 158, 158, 158), // Change the inner color of the container
  ),
  child: InputDecorator(
    decoration: const InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), // Adjust padding to reduce height
    ),
    child: Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconSize: 20, // Reduce the icon size
            isDense: true, // Reduce the overall height
            value: dropdownValue,
            isExpanded: true,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  decoration: BoxDecoration(
                    // Change the inner color of the dropdown item
                    borderRadius: BorderRadius.circular(4.0), // Add border radius
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), // Reduce vertical padding
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 12, fontFamily: 'FontMain4', color: Colors.black),
                  ),
                ),
              );
            }).toList(),
            onChanged: null, // Disable the dropdown
          ),
        ),
      ],
    ),
  ),
)
;
  }
}
