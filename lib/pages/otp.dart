import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import '../utils/app_responsive.dart';

// YOUR UI IMAGE (from screenshot)
const String otpIllustration =
    'sandbox:/mnt/data/b1a68775-3032-46b3-9e62-8af3ddb3e81f.png';

class OtpScreen extends StatefulWidget {
  final bool isComingFromSignup;
  final String fromPath;

  const OtpScreen({
    super.key,
    required this.fromPath,
    required this.isComingFromSignup,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String currentOtp = "";
  bool showError = false;

  final StreamController<ErrorAnimationType> _errorController =
  StreamController<ErrorAnimationType>.broadcast();

  @override
  void dispose() {
    _errorController.close();
    super.dispose();
  }

  void submitOtp() {
    if (currentOtp.length != 6) {
      setState(() => showError = true);
      _errorController.add(ErrorAnimationType.shake);
      return;
    }

    // NO CHANGE in your navigation logic
    if (widget.fromPath == "/general-start") {
      context.push("/success", extra: {
        "imagePath": "assets/images/CheckCircle.png",
        "title": "Verification Successful",
        "subTitle": "Your identity has been verified",
        "buttonText": "Continue",
        "nextPath": "/general-files",
      });
    } else {
      context.push("/success", extra: {
        "imagePath": "assets/images/success.png",
        "title": "Account Created Successfully",
        "subTitle": "You can now explore all features.",
        "buttonText": "Continue",
        "nextPath": "/plans",
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;
    final isDesktop = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false, // ⭐ IMPORTANT: prevents UI moving
      body: isDesktop
          ? buildDesktopUI(context, h, w)
          : buildMobileUI(context, h, w),
    );
  }

  // ---------------- MOBILE UI -------------------
  Widget buildMobileUI(BuildContext context, double h, double w) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.1),
                  Center(
                    child: Image.network(
                      otpIllustration,
                      width: w * 0.65,
                      errorBuilder: (c, e, s) => Image.asset(
                        "assets/images/Layer1.png",
                        width: w * 0.65,
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.03),
                  // Back arrow
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF8E8E8E),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xFFFFC107),
                          size: 28,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.03),



                  Text(
                    "Enter OTP",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: h * 0.028,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: h * 0.005),

                  Text(
                    "OTP sent to the +91 81xxxxxx00",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: h * 0.018,
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: h * 0.025),

                  // PIN TEXT FIELD
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    cursorColor: Colors.white,
                    animationType: AnimationType.fade,
                    errorAnimationController: _errorController,

                    textStyle: TextStyle(
                      fontFamily: "Inter",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: h * 0.026,
                    ),

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: h * 0.065,
                      fieldWidth: w * 0.12,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white30,
                      selectedColor: Colors.white,
                      activeFillColor: Colors.white.withOpacity(0.18),
                      selectedFillColor: Colors.white.withOpacity(0.18),
                      inactiveFillColor: Colors.white.withOpacity(0.18),
                    ),

                    onChanged: (value) {
                      setState(() {
                        currentOtp = value.trim();
                        if (currentOtp.length == 6) {
                          FocusScope.of(context).unfocus(); // ⭐ AUTO CLOSE
                        }
                        showError = false;
                      });
                    },
                  ),

                  if (showError)
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.006),
                      child: Text(
                        "Please enter all 6 digits",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Colors.red,
                          fontSize: h * 0.018,
                        ),
                      ),
                    ),

                  SizedBox(height: h * 0.015),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: const Color(0xFFFEBE01),
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xFFFEBE01),
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: h * 0.4), // Space above bottom button
                ],
              ),
            ),
          ),
        ),

        // ⭐ FIXED BOTTOM BUTTON
        Positioned(
          bottom: h * 0.04,
          left: w * 0.05,
          right: w * 0.05,
          child: GestureDetector(
            onTap: submitOtp,
            child: Container(
              width: double.infinity,
              height: h * 0.065,
              decoration: BoxDecoration(
                color: const Color(0xFFFEBE01),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  "Submit OTP",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Colors.black,
                    fontSize: h * 0.022,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --------------- DESKTOP UI ---------------------
  Widget buildDesktopUI(BuildContext context, double h, double w) {
    return Center(
      child: Container(
        width: w * 0.35,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              otpIllustration,
              width: w * 0.18,
              errorBuilder: (c, e, s) =>
                  Image.asset("assets/images/otp-image.png", width: w * 0.18),
            ),

            SizedBox(height: h * 0.03),

            Text(
              "Enter OTP",
              style: const TextStyle(
                  fontFamily: "Inter", color: Colors.white, fontSize: 26),
            ),

            SizedBox(height: 6),

            const Text(
              "OTP sent to your mobile",
              style: TextStyle(
                  fontFamily: "Inter", color: Colors.white70, fontSize: 15),
            ),

            SizedBox(height: 20),

            // SAME PIN UI
            PinCodeTextField(
              appContext: context,
              length: 6,
              autoFocus: true,
              animationType: AnimationType.fade,
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              errorAnimationController: _errorController,
              textStyle: const TextStyle(
                fontFamily: "Inter",
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 55,
                fieldWidth: 45,
                activeFillColor: Colors.white.withOpacity(0.18),
                inactiveFillColor: Colors.white.withOpacity(0.18),
                selectedFillColor: Colors.white.withOpacity(0.18),
                inactiveColor: Colors.white,
                selectedColor: Colors.yellow,
                activeColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  currentOtp = value.trim();
                  if (currentOtp.length == 6) {
                    FocusScope.of(context).unfocus();
                  }
                  showError = false;
                });
              },
            ),

            if (showError)
              const Text(
                "Please enter all 6 digits",
                style: TextStyle(
                    fontFamily: "Inter", color: Colors.red, fontSize: 14),
              ),

            const SizedBox(height: 30),

            GestureDetector(
              onTap: submitOtp,
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEBE01),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Submit OTP",
                    style: TextStyle(
                        fontFamily: "Inter", fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
