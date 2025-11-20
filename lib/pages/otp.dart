import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clientapp_studio/utils/color_constants.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import '../utils/app_responsive.dart';

class OtpScreen extends StatelessWidget {
  final bool isComingFromSignup;

  final String fromPath;  // <---- RECEIVED HERE

  OtpScreen({super.key, required this.fromPath,required this.isComingFromSignup});

  final List<TextEditingController> _otpControllers =
  List.generate(6, (index) => TextEditingController());

  String getOtp() {
    return _otpControllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    double h = SizeConfig.screenHeight;
    double w = SizeConfig.screenWidth;

    bool isWeb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: isWeb ? buildWebLayout(context, h, w,isWeb,isComingFromSignup) : buildMobileLayout(context, h, w,isWeb),
    );
        }

  // ------------------ MOBILE (UNCHANGED) ------------------

  Widget buildMobileLayout(BuildContext context, double h, double w, bool isweb) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Column(
              children: [
                SizedBox(height: h * 0.15),
                Image.asset("assets/images/Layer1.png", width: w * 0.55),
                SizedBox(height: h * 0.05),

                otpSection(context, h, w, isweb),

                SizedBox(height: h * 0.1),

                GestureDetector(
                  onTap: () {
                    String otp = getOtp();

                    // 🔥 NAVIGATION LOGIC ADDED
                    if (fromPath == "/general-start") {
                        context.push(
                          "/success",
                          extra: {
                            "imagePath": "assets/images/successgreen.png",
                            "title": "Otp Verified \nSuccessful",
                            "subTitle": "",
                            "buttonText": "Continue",
                            "nextPath": "/general-files",
                          },
                      );
                    } else {
                      context.push(
                        "/success",
                        extra: {
                          "imagePath": "assets/images/success.png",
                          "title": "Account Created Successfully",
                          "subTitle": "You can now explore all features.",
                          "buttonText": "Continue",
                          "nextPath": "/plans",
                        },
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: h * 0.06,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFEBE01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.03),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Submit OTP",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.03),

                GestureDetector(
                  onTap: () => context.push('/signin'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ",
                          style: TextStyle(color: Colors.white70, fontSize: h * 0.018)),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFFFEBE01),
                          fontSize: h * 0.018,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFEBE01),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------ WEB LAYOUT ------------------
  Widget buildWebLayout(BuildContext context, double h, double w,bool isweb,
      bool comingfromsigning) {

    return Stack(
      children: [
        /// BLURRED BACKGROUND IMAGE
        if(comingfromsigning)
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
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.black.withOpacity(0.4), // slight dark layer
                ),
              ),
            ],
          ),
        ),


        if(comingfromsigning)

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: w,
              height: h * 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),   // strong black at bottom
                    Color.fromARGB(120, 0, 0, 0),   // fading
                    Color.fromARGB(120, 0, 0, 0),   // fading

                    Color.fromARGB(20, 0, 0, 0),    // very light
                    Colors.transparent,             // smooth end
                  ],
                ),
              ),
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: w,
            height: h,
            color: Colors.black.withOpacity(0.55),
          ),
        ),

        Center(
          child: Container(
            width: w * 0.32,
            padding: const EdgeInsets.all(32),
            decoration: ShapeDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/Layer1.png", width: w * 0.18),

                SizedBox(height: h * 0.03),

                Card(
                  elevation: 16,
                  color: Colors.black.withOpacity(0.75),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  child: Container(
                    width: w * 0.32,
                    padding: EdgeInsets.symmetric(vertical: h * 0.03, horizontal: w * 0.02),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/Layer1.png", width: w * 0.18),
                        SizedBox(height: h * 0.03),

                        otpSection(context, h, w * 0.55,isweb), // reduce width inside card
                        otpSection(context, h, w * 0.55, isweb),

                        SizedBox(height: h * 0.05),

                        GestureDetector(
                          onTap: () {
                            String otp = getOtp();
                            context.push('/plans', extra: "Account Created Successfully");
                          },
                          child: Container(
                            width: double.infinity,
                            height: h * 0.06,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFEBE01),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(h * 0.03),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Submit OTP",
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            String otp = getOtp();

                            // 🔥 NAVIGATION USING fromPath
                            if (fromPath == "/general-start") {
                              context.push(
                                "/success",
                                extra: {
                                  "imagePath": "assets/images/CheckCircle.png",
                                  "title": "Verification Successful",
                                  "subTitle": "Your identity has been verified",
                                  "buttonText": "Continue",
                                  "nextPath": "/general-files",
                                },
                              );
                            } else {
                              context.push('/plans', extra: "Account Created Successfully");
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: h * 0.06,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFEBE01),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(h * 0.03),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Submit OTP",
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: h * 0.03),

                        GestureDetector(
                          onTap: () => context.push('/signin'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ",
                                  style: TextStyle(color: Colors.white70, fontSize: h * 0.018)),
                              Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Color(0xFFFEBE01),
                                  fontSize: h * 0.018,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFFFEBE01),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: h * 0.03),
                      ],
                    ),
                  ),
                ),

      ],
    )
    )
    )
    ]);
  }

  // ------------------ OTP BOXES ------------------
  Widget otpSection(BuildContext context, double h, double w, bool isweb) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => context.pop(),
            child: Container(
              width: h * 0.05,
              height: h * 0.05,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFF848484)),
                borderRadius: BorderRadius.circular(h * 0.04),
              ),
              child: Center(
                child: Icon(Icons.chevron_left, color: Color(0xFFFEBE01)),
              ),
            ),
          ),

          SizedBox(height: h * 0.025),

          Text("Enter OTP",
              style: TextStyle(color: Colors.white, fontSize: h * 0.025, fontWeight: FontWeight.w600)),

          SizedBox(height: h * 0.015),

          Text(
            "OTP sent to +91 81xxxxxx00",
            style: TextStyle(color: Color(0xFFD2D2D2), fontSize: h * 0.020),
          ),

          SizedBox(height: h * 0.025),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              return SizedBox(
                width: (isweb) ? w * 0.07 : w * 0.12,
                height: h * 0.065,
                child: TextField(
                  controller: _otpControllers[index],
                  maxLength: 1,
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: TextStyle(color: Colors.white, fontSize: h * 0.018),
                  decoration: InputDecoration(
                    counterText: "",
                    filled: true,
                    fillColor: Colors.white24,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(h * 0.01),
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(h * 0.01),
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              );
            }),
          ),

          SizedBox(height: h * 0.02),

          Row(
            children: [
              Spacer(),
              Text(
                "Resend OTP",
                style: TextStyle(
                  color: Color(0xFFFEBE01),
                  fontSize: h * 0.02,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFFEBE01),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
