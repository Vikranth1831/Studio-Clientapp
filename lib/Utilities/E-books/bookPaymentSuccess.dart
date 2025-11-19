import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/app_responsive.dart';


class BookPaymentSuccess extends StatefulWidget {
  const BookPaymentSuccess({super.key});

  @override
  State<BookPaymentSuccess> createState() => _BookPaymentSuccessState();
}

class _BookPaymentSuccessState extends State<BookPaymentSuccess> {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    bool isWeb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: isWeb ? _buildWebLayout(context, w, h) : _buildMobileLayout(context, w, h),
    );
  }

  // ------------------ MOBILE (UNCHANGED) ------------------
  Widget _buildMobileLayout(BuildContext context, double w, double h) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/successgreen.png',
                    width: w * 0.5,
                    height: h * 0.25,
                  ),

                  Text(
                    'Payment Done\nSuccessfully',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: h * 0.02),

                  // Text(
                  //   'Your subscription plan has been\nBookPaymentSuccessfully activated!',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     color: Colors.white70,
                  //     fontSize: w * 0.045,
                  //     height: 1.5,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + h * 0.03,
              left: w * 0.08,
              right: w * 0.08,
            ),
            child: SizedBox(
              width: double.infinity,
              height: h * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () => context.push("/viewBook"),
                child: Text(
                  "View Book",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ WEB UI ------------------
  Widget _buildWebLayout(BuildContext context, double w, double h) {
    return Stack(
      children: [
        // Background + Blur
        Positioned.fill(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash_image.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ],
          ),
        ),

        // Center Card
        Center(
          child: Card(
            elevation: 16,
            color: Colors.black.withOpacity(0.75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Container(
              width: w * 0.35,
              height: h * 0.70,
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.02,
                vertical: h * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/new.png',
                            width: w * 0.15,
                            height: h * 0.18,
                          ),

                          SizedBox(height: h * 0.02),

                          Text(
                            'Payment BookPaymentSuccessful!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: w * 0.018,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: h * 0.02),

                          Text(
                            'Your subscription plan has been\nsuccessfully activated!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: w * 0.013,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: h * 0.08,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () => context.go('/sp18'),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: w * 0.015,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

