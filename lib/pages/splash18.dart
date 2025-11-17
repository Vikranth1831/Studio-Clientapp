import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash18 extends StatefulWidget {
  const Splash18({super.key});

  @override
  State<Splash18> createState() => _Splash18State();
}

class _Splash18State extends State<Splash18> {

  @override
  void initState() {
    super.initState();

    /// AUTO-NAVIGATE AFTER 1.5 SECONDS
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        context.go('/dashboard');
      }
    });
  }

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
                /// Centered Image
                Image.asset(
                  'assets/images/fullbook.png',
                  width: width * 0.7,
                  height: height * 0.55,
                ),

                SizedBox(height: height * 0.04),

                /// Main Heading
                Text(
                  'Hey!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: height * 0.02),

                /// Subtext
                Text(
                  'Setting Up \n Your Studio \n ...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffFEBE01),
                    fontSize: 30,
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
