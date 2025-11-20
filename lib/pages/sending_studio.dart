import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/media_query_helper.dart';

class SendingStudio extends StatefulWidget {
  const SendingStudio({super.key});

  @override
  State<SendingStudio> createState() => _SendingStudioState();
}

class _SendingStudioState extends State<SendingStudio> {
  // -------- STATIC CONTENT --------
  String firstImage = "assets/images/sending.png";
  String firstTitle = "Sending to";
  String firstSubtitle = "Dphotowala studio";

  String secondImage = "assets/images/successgreen.png";
  String secondTitle = "Sent Successfully!";
  String secondSubtitle = "Dphotowala studio";

  // -------- CURRENT CONTENT --------
  late String currentImage;
  late String currentTitle;
  late String currentSubtitle;

  @override
  void initState() {
    super.initState();

    // Set first screen content
    currentImage = firstImage;
    currentTitle = firstTitle;
    currentSubtitle = firstSubtitle;

    // Change to second screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        currentImage = secondImage;
        currentTitle = secondTitle;
        currentSubtitle = secondSubtitle;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: h * 0.15),

            // ---------------- CENTER CONTENT ----------------
            Column(
              children: [
                Image.asset(
                  currentImage,
                  width: w * 0.30,
                  height: w * 0.30,
                ),

                SizedBox(height: h * 0.03),

                Text(
                  currentTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 5),

                Text(
                  currentSubtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: "Inter",
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // ---------------- OKAY BUTTON ----------------
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                height: h * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFEBE01),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () {
                    context.go('/dashboard');
                  },
                  child: const Text(
                    "Okay",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
