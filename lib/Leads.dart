// ignore_for_file: sized_box_for_whitespace, deprecated_member_use
// ignore: unused_import
import 'package:loanapp/Leads.dart';
import 'package:loanapp/app_urls.dart';
import 'package:loanapp/bottomNavigation.dart';
import 'package:loanapp/view_leads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loanapp/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  // ignore: use_super_parameters
  const SecondPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<Map<String, dynamic>> apiData = [];
  bool isLoading = true; // Initially loading is true
  bool isError = false;
  int currentPage = 1;
  int pageSize = 10; // Number of notifications per page

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
    fetchData();

    // Display shimmer for 1 second, then show data
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isLoading = false; // After 1 second, set loading to false
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

 Future<void> fetchData() async {
  apiData = [
    {
      'customerName': 'John Doe',
      'leadDate': '2024-10-15',
      'customerMobile': '1234567890',
      'productName': 'Product A',
    },
    {
      'customerName': 'Jane Smith',
      'leadDate': '2024-10-14',
      'customerMobile': '0987654321',
      'productName': 'Product B',
    },
    {
      'customerName': 'Alex Johnson',
      'leadDate': '2024-10-13',
      'customerMobile': '1122334455',
      'productName': 'Product C',
    },
    {
      'customerName': 'Chris Evans',
      'leadDate': '2024-10-12',
      'customerMobile': '9988776655',
      'productName': 'Product D',
    },
    {
      'customerName': 'Mark Ruffalo',
      'leadDate': '2024-10-11',
      'customerMobile': '7766554433',
      'productName': 'Product E',
    },
    {
      'customerName': 'Scarlett Johansson',
      'leadDate': '2024-10-10',
      'customerMobile': '4455667788',
      'productName': 'Product F',
    },
    {
      'customerName': 'Robert Downey',
      'leadDate': '2024-10-09',
      'customerMobile': '9988445566',
      'productName': 'Product G',
    },
    {
      'customerName': 'Chris Hemsworth',
      'leadDate': '2024-10-08',
      'customerMobile': '8877665544',
      'productName': 'Product H',
    },
    {
      'customerName': 'Tom Holland',
      'leadDate': '2024-10-07',
      'customerMobile': '6655443322',
      'productName': 'Product I',
    },
    {
      'customerName': 'Benedict Cumberbatch',
      'leadDate': '2024-10-06',
      'customerMobile': '7788996655',
      'productName': 'Product J',
    },
    {
      'customerName': 'Chadwick Boseman',
      'leadDate': '2024-10-05',
      'customerMobile': '5566778899',
      'productName': 'Product K',
    },
    {
      'customerName': 'Paul Rudd',
      'leadDate': '2024-10-04',
      'customerMobile': '1234432111',
      'productName': 'Product L',
    },
    {
      'customerName': 'Jeremy Renner',
      'leadDate': '2024-10-03',
      'customerMobile': '1122334455',
      'productName': 'Product M',
    },
    {
      'customerName': 'Elizabeth Olsen',
      'leadDate': '2024-10-02',
      'customerMobile': '6677889900',
      'productName': 'Product N',
    },
    {
      'customerName': 'Tom Hiddleston',
      'leadDate': '2024-10-01',
      'customerMobile': '9988771122',
      'productName': 'Product O',
    },
    {
      'customerName': 'Brie Larson',
      'leadDate': '2024-09-30',
      'customerMobile': '7788990011',
      'productName': 'Product P',
    },
    {
      'customerName': 'Don Cheadle',
      'leadDate': '2024-09-29',
      'customerMobile': '8877554433',
      'productName': 'Product Q',
    },
    {
      'customerName': 'Anthony Mackie',
      'leadDate': '2024-09-28',
      'customerMobile': '2233445566',
      'productName': 'Product R',
    },
    {
      'customerName': 'Sebastian Stan',
      'leadDate': '2024-09-27',
      'customerMobile': '4455667788',
      'productName': 'Product S',
    },
    {
      'customerName': 'Samuel L. Jackson',
      'leadDate': '2024-09-26',
      'customerMobile': '3322114455',
      'productName': 'Product T',
    },
  ];

  if (mounted) {
    setState(() {
      isLoading = false; // Set to false once data is fetched
    });
  }
}


  Future<void> _refresh() async {
    setState(() {
      isLoading = true; // Show shimmer effect again
    });

    // Simulate network call or other async operations
    fetchData();

    // Delay to show shimmer before reloading data
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() {
        isLoading = false; // Show data after 1 second
      });
    }
  }

  int get totalPageCount =>
      (apiData.isNotEmpty && apiData.length % pageSize == 0)
          ? apiData.length ~/ pageSize
          : (apiData.length ~/ pageSize) + 1;

  List<Map<String, dynamic>> getNotificationsForCurrentPage() {
    final startIndex = (currentPage - 1) * pageSize;
    final endIndex = startIndex + pageSize;
    return apiData.sublist(startIndex, endIndex.clamp(0, apiData.length));
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      itemCount: 10, // Adjust the number of shimmer items as needed
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 114, 114, 114),
                      highlightColor: const Color.fromARGB(255, 206, 206, 206),
                      child: Container(
                        width: 150,
                        height: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 114, 114, 114),
                      highlightColor: const Color.fromARGB(255, 206, 206, 206),
                      child: Container(
                        width: 140,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 114, 114, 114),
                      highlightColor: const Color.fromARGB(255, 206, 206, 206),
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 114, 114, 114),
                      highlightColor: const Color.fromARGB(255, 206, 206, 206),
                      child: Container(
                        width: 80,
                        height: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(105, 201, 200, 200),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
          },
        ),
        title: const Text(
          "List of Leads",
          style: TextStyle(fontFamily: 'FontMain4', fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? _buildShimmerList()
          : RefreshIndicator(
              onRefresh: _refresh,
              color: const Color(0xFF5854D3), 
              backgroundColor: Colors.white, 
              strokeWidth: 3.0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: getNotificationsForCurrentPage().length,
                      itemBuilder: (context, index) {
                        final item = getNotificationsForCurrentPage()[index];
                        return SecondPage1(
                          slNumber: (currentPage - 1) * pageSize + index + 1,
                          customerName: item['customerName'] ?? '',
                          createdDate: item['leadDate'] ?? '',
                          customerMobile: item['customerMobile'] ?? '',
                          productName: item['productName'] ?? '',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class SecondPage1 extends StatelessWidget {
  final int slNumber;
  final String customerName;
  final String createdDate;
  final String customerMobile;
  final String productName;

  // ignore: use_key_in_widget_constructors
  const SecondPage1({
    required this.slNumber,
    required this.customerMobile,
    required this.customerName,
    required this.createdDate, required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading = customerMobile.isEmpty && productName.isEmpty && createdDate.isEmpty;

    return isLoading
    ? Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 114, 114, 114),
        highlightColor: const Color.fromARGB(255, 206, 206, 206),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(notification: customerName),
              ),
            );
          },
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customerName,
                          style: const TextStyle(
                            fontFamily: 'FontMain4',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            _makePhoneCall(customerMobile);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColors.primaryColor,
                            ),
                            height: 30,
                            width: 140,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.call,
                                    color: AppColors.primaryColor,
                                    size: 10,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  customerMobile,
                                  style: const TextStyle(
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
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'FontMain1',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          createdDate,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    : GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardPage(index: 4,),
            ),
          );
        },
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerName,
                        style: const TextStyle(
                          fontFamily: 'FontMain4',
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          _makePhoneCall(customerMobile);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppColors.primaryColor,
                          ),
                          height: 24,
                          width: 90,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.call,
                                  color: AppColors.primaryColor,
                                  size: 10,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                customerMobile,
                                style: const TextStyle(
                                  fontSize: 10,
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
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'FontMain1',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        createdDate,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
  Future<void> _makePhoneCall(String number) async {
launch("tel://$number");
}


}


