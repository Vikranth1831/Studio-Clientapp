import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../utils/media_query_helper.dart';
import 'package:clientapp_studio/utils/app_responsive.dart';

class CommonIronVault extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final String buttonText;
  final String nextPath;

  const CommonIronVault({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.nextPath,
  });

  @override
  Widget build(BuildContext context) {
    final double h = SizeConfig.screenHeight;
    final double w = SizeConfig.screenWidth;
    final bool isWeb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: isWeb ? _buildWebLayout(h, w, context) : _buildMobileLayout(h, w, context),
      ),
    );
  }

  // ---------------- WEB ----------------
  Widget _buildWebLayout(double h, double w, BuildContext context) {
    return Container(
      width: w * 0.5,
      padding: const EdgeInsets.all(32),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 230,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),

          const SizedBox(height: 25),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: Colors.white70,
              fontSize: 15,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 35),

          Container(
            width: 280,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFEBE01),
                  Color(0xFFD69E9E),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: InkWell(
              onTap: () => context.go(nextPath),
              borderRadius: BorderRadius.circular(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/Lock.png', color: Colors.black),
                  const SizedBox(width: 10),
                  Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- MOBILE ----------------
  Widget _buildMobileLayout(double h, double w, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: h * 0.3,
            width: w,
            child: Image.asset(imagePath),
          ),

          SizedBox(height: h * 0.03),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: h * 0.01),

          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.white70,
              fontSize: w * 0.04,
            ),
          ),

          SizedBox(height: h * 0.04),

          Container(
            width: w * 0.6,
            height: h * 0.065,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFEBE01),
                  Color(0xFFD69E9E),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: InkWell(
              onTap: () => context.go(nextPath),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/Lock.png', color: Colors.black),
                  SizedBox(width: w * 0.02),
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
