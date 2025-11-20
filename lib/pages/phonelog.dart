import 'dart:ui';
import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      resizeToAvoidBottomInset: false,   // ⭐ FIXED BUTTON
      body: SafeArea(
        child: isWeb
            ? _buildWebLayout(width, height)
            : _buildMobileLayout(width, height),
      ),
    );
  }

  // ------------------------------- MOBILE UI -----------------------------
  Widget _buildMobileLayout(double width, double height) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
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

                        SizedBox(height: height * 0.02),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(color: Colors.white),
                            maxLength: 10,
                            onChanged: (value) {
                              if (value.length == 10) {
                                FocusScope.of(context).unfocus(); // ⭐ AUTO CLOSE
                              }
                            },
                            decoration: InputDecoration(
                              counterText: "",
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100), // space above bottom button
          ],
        ),

        // ⭐ FIXED BOTTOM BUTTON
        Positioned(
          bottom: height * 0.05,
          left: width * 0.08,
          right: width * 0.08,
          child: SizedBox(
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
                  context.push('/otp', extra: {
                    "isComing": true,
                    "fromPath": "phonelog",
                  });
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

  // ------------------------------- WEB UI (UNCHANGED) -----------------------------
  Widget _buildWebLayout(double width, double height) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
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
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Container(
              width: width * 0.32,
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
                  Image.asset('assets/images/log.png', width: width * 0.18),

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

                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.white),
                    maxLength: 10,
                    onChanged: (value) {
                      if (value.length == 10) {
                        FocusScope.of(context).unfocus();
                      }
                    },
                    decoration: InputDecoration(
                      counterText: "",
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
                          context.push('/otp', extra: {
                            "isComing": true,
                            "fromPath": "phonelog",
                          });
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
        ],
      ),
    );
  }
}
