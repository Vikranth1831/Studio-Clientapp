import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import '../../utils/media_query_helper.dart';

class IronVault1 extends StatefulWidget {
  const IronVault1({super.key});

  @override
  State<IronVault1> createState() => _IronVault1State();
}

class _IronVault1State extends State<IronVault1> {
  @override
  Widget build(BuildContext context) {
    final double h = SizeConfig.screenHeight;
    final double w = SizeConfig.screenWidth;
    final bool isweb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: isweb
            ? _buildWebLayout(h, w)   // For desktop/web
            : _buildMobileLayout(h, w), // For mobile
      ),
    );
  }

  /// ---------------- WEB LAYOUT ----------------
  Widget _buildWebLayout(double h, double w) {
    return Container(
      width: w * 0.5,
      padding: const EdgeInsets.all(32),
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),


      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// IMAGE
          SizedBox(
            height: 230,
            child: Image.asset(
              'assets/images/imagesh.png',
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 25),

          /// BOLD TEXT
          const Text(
            "Secure Document Vault",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          /// NORMAL TEXT
          const Text(
            "Your Sensitive Documents Are Protected with\nMulti layer Security verification",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.white70,
              fontSize: 15,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 35),

          /// BUTTON
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
              onTap: () {
                
              },
              borderRadius: BorderRadius.circular(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/Lock.png', color: Colors.black),
                  const SizedBox(width: 10),
                  const Text(
                    "Access Iron Vault",
                    style: TextStyle(
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

  /// ---------------- MOBILE LAYOUT (NO CHANGES) ----------------
  Widget _buildMobileLayout(double h, double w) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            child: Image.asset('assets/images/imagesh.png'),
            height: h * 0.3,
            width: w * 1,
          ),

          SizedBox(height: h * 0.03),

          Text(
            "Secure Document Vault",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: h * 0.01),

          Text(
            "Your Sensitive Documents Are Protected with \n Multi layer Security verification",
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
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFEBE01),
                  Color(0xFFD69E9E),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/Lock.png', color: Colors.black),
                  SizedBox(width: w * 0.02),
                  Text(
                    "Access Iron Vault",
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

