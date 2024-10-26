import 'package:flutter/material.dart';
import 'package:loanapp/app_colors.dart';
import 'package:loanapp/bottomNavigation.dart';
// ignore: unused_import
import 'package:loanapp/update_Leads.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final String notification;

  // ignore: use_super_parameters
  const DetailPage({Key? key, required this.notification}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _DetailPageState createState() => _DetailPageState();

  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) => throw UnimplementedError();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
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
      backgroundColor: Colors.grey[100],
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
                  "View Leads #22567",
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
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black,
                ),
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'New Lead',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
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
                const SizedBox(height: 10),
                Container(
  decoration: BoxDecoration(
    image: const DecorationImage(
      image: AssetImage('assets/images/card.png'), // Replace with your image asset path
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loan Amount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'FontMain3',
                  ),
                ),
                Text(
                  'Rs.50,000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'FontMain4',
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tenure',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'FontMain3',
                  ),
                ),
                Text(
                  'Rs. 50,000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'FontMain4',
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromRGBO(238, 207, 213, 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                        size: 8,
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frequency',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'FontMain3',
                  ),
                ),
                Text(
                  '30 Days',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'FontMain4',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ),
)
,
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Text('Full Name:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                  SizedBox(
  width: MediaQuery.of(context).size.width,
  child:TextField(
  controller: fullNameController,
  enabled: false, // Add the controller here
  decoration: const InputDecoration(
    hintText: 'Enter Full Name',
    filled: true, // Enable filling the background
    fillColor: Color.fromARGB(98, 158, 158, 158), // Set the background color to grey
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2), // Change border color to red
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2), // Change border color to grey when disabled
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), // Adjust the padding to reduce the height
  ),
  style: const TextStyle(
    fontSize: 12,
    fontFamily: 'FontMain4',
    color: Colors.black,
  ),
),

),

                    const SizedBox(height: 15),
                    const Text('Product:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                     // Reduce the height here
                    CustomDropdown(),
                    const SizedBox(height: 15),
                    const Text('Lead Source:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                    CustomDropdown(),
                    const SizedBox(height: 15),
                    const Text('Created Date:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                   TextField(
    controller: createdDateController, 
    enabled: false,// Add the controller here
    decoration: const InputDecoration(
      hintText: 'Enter Created Date',
      filled: true, // Enable filling the background
      fillColor: Color.fromARGB(98, 158, 158, 158), // Set the background color to grey
     border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2), // Change border color to red
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2), // Change border color to grey when disabled
      ),
       contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    ),
    style: const TextStyle(fontSize: 12, fontFamily: 'FontMain4',color: Colors.black),
    
  ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: ElevatedButton(
                        onPressed: () {
                             Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const DashboardPage(index: 5,),
            ),
          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: AppColors.primaryColor, width: 1.2),
                            ),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 20,
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: const Center(
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.white, fontFamily: 'FontMain4', fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                )
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
