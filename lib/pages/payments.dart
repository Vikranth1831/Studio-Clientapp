import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_responsive.dart';

class Payments extends StatefulWidget {
  final bool fromBookPage; // when true → open centered card

  const Payments({super.key, this.fromBookPage = false});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final List<String> paymentOptions = [
    'UPI',
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

    // 👉 If opened from BookDetails → always show the CENTER CARD UI
    if (widget.fromBookPage) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Payments',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Inter"
          ),),
        ),
        body:(isWeb) ? _centerCardLayout(context, w, h,widget.fromBookPage) :  _mobileLayout(context, w, h),
      );
    }

    // 👉 Else → normal behavior (mobile or web)
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isWeb
          ? null
          : AppBar(
        backgroundColor: Colors.black,
        title: const Text("Payments"),
      ),
      body: isWeb
          ? _centerCardLayout(context, w, h,widget.fromBookPage)
          : _mobileLayout(context, w, h),
    );
  }

  // ---------------- MOBILE NORMAL LAYOUT ----------------
  Widget _mobileLayout(BuildContext context, double w, double h) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h * 0.03),

          Text(
            "Payment Options",
            style: TextStyle(
                fontSize: w * 0.05,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),

          SizedBox(height: h * 0.02),

          Expanded(child: paymentList(w, h, false)),

          continueButton(w, h, false),
          SizedBox(height: h * 0.05),
        ],
      ),
    );
  }

  // ---------------- CENTER CARD LAYOUT (used for fromBookPage + Desktop) ----------------
  Widget _centerCardLayout(BuildContext context, double w, double h,bool fromebook) {
    return Stack(
      children: [

        if(!fromebook)
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
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
            ],
          ),
        ),

        Center(
          child: Card(
          //  elevation: 18,
            color: Colors.black.withOpacity(0.75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: w * 0.40,
              height: h * 0.75,
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.02, vertical: h * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Options",
                    style: TextStyle(
                        fontSize: w * 0.02,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: h * 0.02),

                  Expanded(child: paymentList(w, h, true)),

                  continueButton(w, h, true),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  // ---------------- PAYMENT LIST ----------------
  Widget paymentList(double w, double h, bool isWeb) {
    double paddingH = isWeb ? w * 0.015 : w * 0.04;
    double paddingV = isWeb ? h * 0.015 : h * 0.02;
    double fontSize = isWeb ? w * 0.013 : w * 0.04;
    double circleSize = isWeb ? w * 0.02 : w * 0.06;

    return ListView.builder(
      itemCount: paymentOptions.length,
      itemBuilder: (context, index) {
        final option = paymentOptions[index];
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: h * 0.01),
            padding:
            EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
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
                Text(
                  option,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500),
                ),
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

  // ---------------- CONTINUE BUTTON ----------------
  Widget continueButton(double w, double h, bool isWeb) {
    bool enableButton = selectedIndex != -1;
    print(widget.fromBookPage);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: isWeb ? h * 0.07 : h * 0.065,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: enableButton ? Colors.amber : Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
          ),
          onPressed: !enableButton
              ? null
              : () {
            // If opened from BookDetails → go to YOUR PATH
            if (widget.fromBookPage) {
              print("print");
              context.push('/success',
                extra: {
                  "image": "assets/images/new.png",
                  "title": "Payment Successful!",
                  "sub": "Your subscription has started!",
                  "btn": "Continue",
                  "path": "/home"
                },); // << CHANGE HERE
            } else {
              context.push('/success',
                extra: {
                  "image": "assets/images/new.png",
                  "title": "Payment Successful!",
                  "sub": "Your subscription has started!",
                  "btn": "Continue",
                  "path": "/home"
                },);
            }
          },
          child: Text(
            "Continue",
            style: TextStyle(
                color: Colors.black,
                fontSize: isWeb ? w * 0.018 : w * 0.045,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
