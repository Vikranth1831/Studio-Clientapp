import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';

class CommonOtpScreen extends StatefulWidget {
  final String title;         // Text above input
  final String buttonText;    // Button label
  final String nextPath;      // Route to navigate

  const CommonOtpScreen({
    super.key,
    required this.title,
    required this.buttonText,
    required this.nextPath,
  });

  @override
  State<CommonOtpScreen> createState() => _CommonOtpScreenState();
}

class _CommonOtpScreenState extends State<CommonOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double h = SizeConfig.screenHeight;
    final double w = SizeConfig.screenWidth;
    bool isWeb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: isWeb ? w * 0.35 : w * 0.85,
          padding: EdgeInsets.symmetric(
            vertical: h * 0.03,
            horizontal: w * 0.05,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// DYNAMIC TITLE
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff514B4B),
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// OTP INPUT
                TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  textAlign: TextAlign.center,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter OTP",
                    counterText: "",
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) return "OTP cannot be empty";
                    if (value.length != 4) return "OTP must be exactly 4 digits";
                    return null;
                  },
                ),

                SizedBox(height: h * 0.03),

                /// BUTTON (DYNAMIC TEXT + ROUTE)
                SizedBox(
                  width: double.infinity,
                  height: h * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFEBE01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.go(widget.nextPath);
                      }
                    },

                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
    );
  }
}
