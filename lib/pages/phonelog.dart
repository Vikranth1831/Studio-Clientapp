import 'dart:ui';

import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Only if using GoRouter

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool isWeb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: isWeb
            ? _buildWebLayout(width, height)
            : _buildMobileLayout(width, height),
      ),
    );
  }

  // ------------------------------- MOBILE UI (UNCHANGED) -----------------------------
  Widget _buildMobileLayout(double width, double height) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.03),

                    Image.asset(
                      'assets/images/log.png',
                      width: width * 0.6,
                      height: height * 0.35,
                    ),

                    SizedBox(height: height * 0.03),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  Hello!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.001),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  Enter your phone number',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.015),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Colors.grey[900],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 16),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (value.length != 10) {
                            return 'Enter a valid 10-digit number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            bottom: height * 0.05,
            left: width * 0.08,
            right: width * 0.08,
          ),
          child: SizedBox(
            width: double.infinity,
            height: height * 0.065,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.push('/otp');
                }
              },
              child: Text(
                "Send OTP",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------- WEB UI -----------------------------
  Widget _buildWebLayout(double width, double height) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          /// BACKGROUND IMAGE
          /// BLURRED BACKGROUND IMAGE
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
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), // STRONG BLUR
                  child: Container(
                    color: Colors.black.withOpacity(0.25), // slight dark layer
                  ),
                ),
              ],
            ),
          ),


          /// BOTTOM BLACKISH OVERLAY
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              height: height * 0.45,
              color: Colors.black.withOpacity(0.55),
            ),
          ),

          /// CENTER CARD
          Center(
            child: Card(
              color: Colors.black.withOpacity(0.7),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: width * 0.32,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.03,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/log.png',
                      width: width * 0.18,
                    ),

                    const SizedBox(height: 15),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hello!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.018,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter your phone number",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: width * 0.012,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// PHONE FIELD
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.grey[900],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (value.length != 10) {
                          return 'Enter a valid 10-digit number';
                        }
                        return null;
                      },
                    ),


                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                            context.push('/otp');
                          }
                        },
                        child: Text(
                          "Send OTP",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.014,
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
      ),
    );
  }
}

