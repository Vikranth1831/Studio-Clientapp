import 'dart:ui';

import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Plans extends StatefulWidget {
  const Plans({super.key});

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> plans = [
    {
      'storage': '20Gb',
      'price': '₹1,000',
      'desc': 'Single Device with AES encrypted end-to-end',
      'tag': 'Basic',
      'tagColor': Colors.cyanAccent,
    },
    {
      'storage': '40Gb',
      'price': '₹2,000',
      'desc': 'Dual Device with AES encrypted end-to-end',
      'tag': 'Standard',
      'tagColor': Color(0xffFEBE01),
    },
    {
      'storage': '60Gb',
      'price': '₹3,000',
      'desc': 'Dual Device with AES encrypted end-to-end',
      'tag': 'Advance',
      'tagColor': Colors.lightGreenAccent,
    },
    {
      'storage': '100Gb',
      'price': '₹4,500',
      'desc': 'Dual Device with AES encrypted end-to-end',
      'tag': 'Premium',
      'tagColor': Colors.greenAccent,
    },
    {
      'storage': '100Gb',
      'price': '₹3,000',
      'desc': 'Dual Device with AES encrypted end-to-end',
      'tag': 'Elite',
      'tagColor': Colors.cyan,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final isWeb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: isWeb
          ? _buildWebLayout(context, width, height)
          : _buildMobileLayout(context, width, height),
    );
  }

  // ------------------ MOBILE ORIGINAL UI (UNCHANGED) ------------------
  Widget _buildMobileLayout(BuildContext context, double width, double height) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.1),

            Text(
              'Hello!!',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Select your plan',
              style: TextStyle(
                color: Colors.white70,
                fontSize: width * 0.05,
              ),
            ),

            SizedBox(height: height * 0.05),

            Text(
              'Select Subscription Plan',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.06,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: height * 0.02),

            Expanded(child: planList(width, height)),

            Padding(
              padding: EdgeInsets.only(bottom: height * 0.035),
              child: continueButton(width, height),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ WEB UI ------------------
  Widget _buildWebLayout(BuildContext context, double width, double height) {
    return Stack(
      children: [
        /// Background + BLUR
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

        /// Center card
        Center(
          child: Card(
            elevation: 18,
            color: Colors.black.withOpacity(0.75),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              width: width * 0.38,
              height: height * 0.75,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Select Subscription Plan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.018,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  /// plans inside card
                  Expanded(
                    child: SingleChildScrollView(
                      child: planList(width * 0.6, height),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  continueButton(width * 0.6, height),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  // ------------------ Shared Plan List ------------------
  Widget planList(double width, double height) {
    final bool isWeb = AppResponsive.isDesktop(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index;
        final plan = plans[index];

        double padding = isWeb ? width * 0.02 : width * 0.04;
        double titleSize = isWeb ? width * 0.015 : width * 0.045;
        double descSize = isWeb ? width * 0.012 : width * 0.03;
        double tagWidth = isWeb ? width * 0.08 : width * 0.17;
        double tagHeight = isWeb ? height * 0.03 : height * 0.025;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.01),
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffFEBE01) : Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// LEFT SECTION
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: titleSize,
                          ),
                          children: [
                            TextSpan(text: 'Storage ${plan['storage']} for '),
                            TextSpan(
                              text: plan['price'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: height * 0.006),

                      Text(
                        plan['desc'],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: descSize,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: width * 0.02),

                /// RIGHT TAG
                Container(
                  alignment: Alignment.center,
                  height: tagHeight,
                  width: tagWidth,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : plan['tagColor'],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    plan['tag'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: isWeb ? width * 0.012 : width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ------------------ Continue Button ------------------
  Widget continueButton(double width, double height) {
    bool isweb=AppResponsive.isDesktop(context);
    return (selectedIndex!=-1) ?
    SizedBox(
      width: double.infinity,
      height:(isweb) ? height * 0.082:  height * 0.065,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffFEBE01),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        onPressed: selectedIndex != -1 ? () => context.push('/payments') : null,
        child: Text(
          'Continue',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16 ,
          ),
        ),
      ),
    ) : SizedBox.shrink();
  }
}

