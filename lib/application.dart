// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loanapp/app_colors.dart';
import 'package:loanapp/bottomNavigation.dart';
import 'package:loanapp/view_leads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class thiredScreen extends StatefulWidget {
  const thiredScreen({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<thiredScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  List<Map<String, dynamic>> apiData = [];
  bool isLoading = true;
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
    // Replace API call with hardcoded data
    _loadSampleData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadSampleData() {
    // Sample data
    apiData = List.generate(pageSize, (index) {
      return {
        'customerName': 'Customer ${index + 1}',
        'leadDate': '2024-10-16',
        'customerMobile': '123456789${index % 10}',
        'productName': 'Product ${index + 1}',
      };
    });
    isLoading = false; // Set loading to false after data is loaded
    setState(() {});
  }

  Future<void> nextPage() async {
    if (currentPage < totalPageCount) {
      setState(() {
        currentPage++;
      });
    }
  }

  Future<void> previousPage() async {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
      });
    }
  }

  Future<void> _refresh() async {
    // Simulate a refresh
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Re-load sample data on refresh
      _loadSampleData();
    });
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Applications",
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
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
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.grey[200],
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: previousPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                'Page $currentPage of $totalPageCount',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.white,
                ),
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

  const SecondPage1({
    required this.slNumber,
    required this.customerMobile,
    required this.customerName,
    required this.createdDate,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardPage(index: 7),
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
                          color: AppColors.fourthColor,
                        ),
                        height: 30,
                        width: 140,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.phone,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Call",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontFamily: 'FontMain4',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      createdDate,
                      style: const TextStyle(
                        fontFamily: 'FontMain4',
                        fontSize: 12,
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

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

