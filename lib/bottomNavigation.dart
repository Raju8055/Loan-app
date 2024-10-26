import 'package:flutter/material.dart';
import 'package:loanapp/Leads.dart';
import 'package:loanapp/fourthscreen.dart';
import 'package:loanapp/home.dart';
// ignore: duplicate_import
import 'package:loanapp/Leads.dart';
import 'package:loanapp/application.dart';
import 'package:loanapp/update_Leads.dart';
import 'package:loanapp/view_application.dart';
import 'package:loanapp/view_leads.dart';

class CustomNavigationBarItem {
  final IconData icon;
  final String title;

  CustomNavigationBarItem({
    required this.icon,
    required this.title,
  });
}

class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomNavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, 
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      
  color: Colors.white,
  elevation: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
    
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.items.length, (index) {
            return InkWell(
              onTap: () {
                widget.onTap(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: index == widget.currentIndex
                      ? const Color(0xFF5854D3).withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.items[index].icon,
                      size: 28,
                      color: index == widget.currentIndex
                          ? const Color(0xFF5854D3)
                          : Colors.black,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.items[index].title,
                      style: TextStyle(
                        fontSize: 12,
                        color: index == widget.currentIndex
                            ? const Color(0xFF5854D3)
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  final int index;

  const DashboardPage({super.key, required this.index});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int _selectedIndex;

  final List<Widget> _widgetOptions = <Widget>[
      const HomePage(),
    const SecondPage(),
    const thiredScreen(),
    const fourthscreen(),
    const DetailPage(notification: ''),
    LoanSlider(),
    SuccessScreen(),
    const ApplicationView(notification: ''),
  ];

  void _onItemTapped(int index) {
    if(mounted){
    setState(() {
      _selectedIndex = index;
    });
    }
  }

  void updateState() {
    if (_selectedIndex == 4) {
      _widgetOptions[4];
      _selectedIndex = 4;
      if(mounted){
      setState(() {});
      }
    } else if (_selectedIndex == 5) {
      _widgetOptions[5];
      _selectedIndex = 5;
      if(mounted){
      setState(() {});
      }
    } else if (_selectedIndex == 6) {
      _widgetOptions[6];
      _selectedIndex = 6;
      if(mounted){
      setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
    updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: _selectedIndex >= 0
          ? _widgetOptions.elementAt(_selectedIndex)
          : _widgetOptions[1],
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomNavigationBarItem(
            icon: Icons.dashboard_outlined,
            title: 'Home',
          ),
          CustomNavigationBarItem(
            icon: Icons.list_alt_sharp,
            title: 'Leads',
          ),
          CustomNavigationBarItem(
            icon: Icons.check_box_outlined,
            title: 'Applications',
          ),
          CustomNavigationBarItem(
            icon: Icons.person_pin,
            title: 'Update Profile',
          ),
        ],
        currentIndex: _selectedIndex >= 0 ? _selectedIndex : -1,
        onTap: _onItemTapped,
      ),
    );
  }
}
