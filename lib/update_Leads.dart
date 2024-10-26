import 'package:flutter/material.dart';
import 'package:loanapp/app_colors.dart';
import 'package:loanapp/bottomNavigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoanSlider(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LoanSlider extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoanSliderState createState() => _LoanSliderState();
}

class _LoanSliderState extends State<LoanSlider> {
  double _loanAmount = 10000;
    double _years = 1.0;
  double _months = 0.0;
  double _frequency = 30.0;
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  late String dropdownValue;
  TextEditingController mobileNumberController = TextEditingController(text: '8861308362');
  TextEditingController fullNameController = TextEditingController(text: 'Raju S');
  TextEditingController createdDateController = TextEditingController(text: '01/10/2000');

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
                  "Update Leads #22567",
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
      body: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            trackColor: MaterialStateProperty.all(const Color.fromARGB(255, 240, 240, 240)),
            trackBorderColor: MaterialStateProperty.all(const Color.fromARGB(255, 200, 200, 200)),
            thumbColor: MaterialStateProperty.all(Colors.grey),
            thickness: MaterialStateProperty.all(6.0),
            radius: const Radius.circular(5),
            thumbVisibility: MaterialStateProperty.all(true),
            minThumbLength: 48,
          ),
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Loan Amount: ',
                        style: TextStyle(
                          fontFamily: 'FontMain3',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Rs.${_loanAmount.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},')}',
                        style: const TextStyle(
                          fontFamily: 'FontMain4',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
              SliderTheme(
  data: SliderTheme.of(context).copyWith(
    activeTrackColor: AppColors.primaryColor,
    inactiveTrackColor: Colors.grey,
    trackHeight: 8.0,
    thumbColor: AppColors.primaryColor,
    overlayColor: AppColors.primaryColor.withOpacity(0.3),
    valueIndicatorColor: AppColors.primaryColor,
    valueIndicatorTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    thumbShape: const CustomThumbShape(radius: 12.0), // Use the custom thumb shape
  ),
  child: Slider(
    value: _loanAmount,
    min: 10000.0,
    max: 2000000.0,
    divisions: 20,
    onChanged: (value) {
      setState(() {
        _loanAmount = value;
      });
    },
    onChangeStart: (value) {
      // Handle when user starts sliding
    },
    onChangeEnd: (value) {
      // Handle when user stops sliding
    },
    label: 'Rs.${_loanAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},')}', // Display current value dynamically with comma separator
  ),
), 
const SizedBox(height: 20),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Tenure: ',
          style: TextStyle(
            fontFamily: 'FontMain3',
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        Text(
          ' ${_years.toStringAsFixed(0)} Years ${_months.toStringAsFixed(0)} Months',
          style: const TextStyle(
            fontFamily: 'FontMain4',
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    ),
    const SizedBox(height: 20), // Add some space between the text and the sliders
    const Text(
      'Select Years:',
      style: TextStyle(
        fontFamily: 'FontMain3',
        fontSize: 15,
        color: Colors.black,
      ),
    ),
    SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: AppColors.primaryColor,
        inactiveTrackColor: Colors.grey,
        trackHeight: 8.0,
        thumbColor: AppColors.primaryColor,
        thumbShape: const CustomThumbShape(radius: 12.0),
        overlayColor: AppColors.primaryColor.withOpacity(0.3),
      ),
      child: Slider(
        value: _years,
        min: 1.0,
        max: 5.0,
        divisions: 5,
        onChanged: (value) {
          setState(() {
                _years = value;
                if (_years == 5.0) {
                  _months = 0.0; // Reset months to 0 when years is 5
                }
              });
        },
        label: '${_years.toStringAsFixed(0)} Years ${_months.toStringAsFixed(0)} Months',
      ),
    ),
    const SizedBox(height: 20), // Add some space between the sliders
    const Text(
      'Select Months:',
      style: TextStyle(
        fontFamily: 'FontMain3',
        fontSize: 15,
        color: Colors.black,
      ),
    ),
    SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: AppColors.primaryColor,
        inactiveTrackColor: Colors.grey,
        trackHeight: 8.0,
        thumbColor: AppColors.primaryColor,
        thumbShape: const CustomThumbShape(radius: 12.0),
        overlayColor: AppColors.primaryColor.withOpacity(0.3),
      ),
      child: Slider(
        value: _months,
        min: 0.0,
        max: 11.0,
        divisions: 11,
       onChanged: _years == 5.0 ? null : (value) {
              setState(() {
                _months = value;
              });
            },
        label: '${_months.toStringAsFixed(0)} Months',
      ),
    ),
  ],
),

                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Frequency: ',
                        style: TextStyle(
                          fontFamily: 'FontMain3',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${_frequency.toStringAsFixed(0)} days',
                        style: const TextStyle(
                          fontFamily: 'FontMain4',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: AppColors.primaryColor,
                      inactiveTrackColor: Colors.grey,
                      trackHeight: 8.0,
                      thumbColor: AppColors.primaryColor,
                      thumbShape: const CustomThumbShape(radius: 12.0),
                      overlayColor: Colors.blue.withOpacity(0.3),
                    ),
                    child: Slider(
                      value: _frequency,
                      min: 1.0,
                      max: 120.0,
                      divisions: 20,
                      onChanged: (value) {
                        setState(() {
                          _frequency = value;
                        });
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text('Full Name:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: fullNameController,
                         
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
                          style: const TextStyle(fontSize: 12, fontFamily: 'FontMain4', color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text('Mobile Number:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: mobileNumberController,
                         
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
                          style: const TextStyle(fontSize: 12, fontFamily: 'FontMain4', color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text('Product:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                      CustomDropdown(),
                      const SizedBox(height: 15),
                      const Text('Lead Source:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                      CustomDropdown(),
                      const SizedBox(height: 15),
                      const Text('Created Date:', style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'FontMain3')),
                      TextField(
                        controller: createdDateController,
                       // Add the controller here
                        decoration: const InputDecoration(
                          hintText: 'Enter Created Date',
                          filled: true, // Enable filling the background
                          fillColor: Color.fromARGB(98, 158, 158, 158), // Set the background color to grey
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2), // Change border color to red
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), // Adjust the padding to reduce the height
                        ),
                        style: const TextStyle(fontSize: 12, fontFamily: 'FontMain4', color: Colors.black),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DashboardPage(index: 6,)),
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
                                'Save',
                                style: TextStyle(color: Colors.white, fontFamily: 'FontMain4', fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ],
              ),
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
    );
  }
}

// ignore: use_key_in_widget_constructors
class SuccessScreen extends StatelessWidget {
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
                  "Update Leads #22567",
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
            
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset('assets/images/successful.png', height: 250),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Successful',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'FontMain4',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: Text(
                        'Lead saved successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: 'FontMain4',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 150), // Added extra space before the button
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class CustomThumbShape extends SliderComponentShape {
  final double radius;

  const CustomThumbShape({required this.radius});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white // Color of the white border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Width of the border

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius - 2.0, borderPaint); // Adjust border width
  }
}
