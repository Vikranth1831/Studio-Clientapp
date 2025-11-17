import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:clientapp_studio/Components/CutomAppBar.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_responsive.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final List<String> paymentOptions = [
    'Upi',
    'Cards',
    'Net Banking',
    'Wallets',
    'Gift Cards'
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool isWeb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar:  (isWeb) ? null : CustomAppBar1(
        title: 'Payment',
        actions: const [],
        issetting: false,
        actions: const [], issetting: false,isdocuments: false,
      ),
      body: isWeb ? _buildWebLayout(context, w, h) : _buildMobileLayout(context, w, h),
    );
  }

  // ------------------ MOBILE (UNCHANGED) ------------------
  Widget _buildMobileLayout(BuildContext context, double w, double h) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h * 0.03),

          Text(
            "All Payment options",
            style: TextStyle(
              color: Colors.white,
              fontSize: w * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: h * 0.02),

          Expanded(child: paymentList(w, h, false)),

          SizedBox(height: h * 0.03),

          continueButton(w, h, false),
        ],
      ),
    );
  }

  // ------------------ WEB UI ------------------
  Widget _buildWebLayout(BuildContext context, double w, double h) {
    return Stack(
      children: [
        /// BG + BLUR
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
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),


        /// CENTER CARD
        Center(
          child: Card(
            elevation: 18,
            color: Colors.black.withOpacity(0.70),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              width: w * 0.38,
              height: h * 0.75,
              padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Payment options",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: h * 0.03),

                  Expanded(child: paymentList(w * 0.6, h, true)),

                  SizedBox(height: h * 0.02),

                  continueButton(w * 0.6, h, true),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  // ------------------ PAYMENT LIST (ADJUSTED FOR WEB) ------------------
  Widget paymentList(double w, double h, bool isWeb) {
    double paddingH = isWeb ? w * 0.015 : w * 0.04;
    double paddingV = isWeb ? h * 0.015 : h * 0.022;
    double fontSize = isWeb ? w * 0.013 : w * 0.04;
    double circleSize = isWeb ? w * 0.03 : w * 0.06;

    return ListView.builder(
      itemCount: paymentOptions.length,
      itemBuilder: (context, index) {
        final option = paymentOptions[index];
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: h * 0.01),
            padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? Colors.amber : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Payment type text
                Flexible(
                  child: Text(
                    option,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                /// Circular indicator
                Container(
                  height: circleSize,
                  width: circleSize,
                  decoration: const BoxDecoration(
                    color: Color(0xffDBAF73),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ------------------ CONTINUE BUTTON (WEB + MOBILE ADAPTIVE) ------------------
  Widget continueButton(double w, double h, bool isWeb) {
    return SizedBox(
      width: double.infinity,
      height: (isWeb) ? h * 0.07:  h * 0.065,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: selectedIndex != -1 ? () => context.go('/success') : null,
        child: Text(
          "Continue",
          style: TextStyle(
            color: Colors.black,
            fontSize: isWeb ? w * 0.018 : w * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

