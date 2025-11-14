import 'package:flutter/material.dart';

class Splash18 extends StatefulWidget {
  const Splash18({super.key});

  @override
  State<Splash18> createState() => _Splash18State();
}

class _Splash18State extends State<Splash18> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;   
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ✅ Centered Image
                Image.asset(
                  'assets/images/fullbook.png', // 👈 change to your image path
                  width: width * 0.5,
                  height: height * 0.25,
                ),

                SizedBox(height: height * 0.04),

                /// ✅ Main Heading
                Text(
                  'Hey!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: height * 0.02),

                /// ✅ Subtext
                Text(
                  'Setting Up \n Your Studio \n ...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffFEBE01),
                    fontSize: width * 0.095,

                    height: 1.5,
                    fontWeight: FontWeight.w900,
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
