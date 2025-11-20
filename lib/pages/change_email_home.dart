import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ChangeEmailHome extends StatelessWidget {
  const ChangeEmailHome({super.key});

  @override
  Widget build(BuildContext context) {
    var h=SizeConfig.screenHeight;
    var w=SizeConfig.screenWidth;
    return Scaffold(
      backgroundColor: Colors.black,
        body: VerifyMailWeb(width: w, height: h,context: context));
  }
  Widget VerifyMailWeb({
    required double width,
    required double height,
    required BuildContext context
  }) {
    // Responsive multipliers
    double containerWidth = width * 0.35;     // Adjust for web/TV layout
    double containerHeight = height * 0.55;
    double svgSize = width * 0.10;            // Responsive image
    double titleSize = width * 0.015;
    double subtitleSize = width * 0.012;
    double buttonHeight = height * 0.06;
    double buttonFontSize = width * 0.012;

    return Center(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
        decoration: ShapeDecoration(
          color: const Color(0x19F7F9FE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TOP SVG
            SizedBox(
              width: svgSize,
              height: svgSize,
              child: Image.asset('assets/icons/change_email.png')
            ),

            SizedBox(height: height * 0.03),

            // TITLE + SUBTITLE
            Text(
              "Please Verify",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFF5F5F5),
                fontSize: titleSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.4,
                letterSpacing: 0.32,
              ),
            ),

            Text(
              "To Change your Mail ID",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFF5F5F5),
                fontSize: subtitleSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.4,
                letterSpacing: 0.26,
              ),
            ),

            SizedBox(height: height * 0.04),

            // BUTTON
            InkWell(
              onTap: ()
              {

                context.push('/otp', extra: false);              },
              child: Container(
                width: double.infinity,
                height: buttonHeight,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEBE01),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Send OTP to Phone no',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: buttonFontSize,
                      fontFamily: 'Poppins',
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
