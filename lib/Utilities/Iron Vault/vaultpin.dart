import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Vaultpin extends StatefulWidget {
  const Vaultpin({super.key});

  @override
  State<Vaultpin> createState() => _VaultpinState();
}

class _VaultpinState extends State<Vaultpin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();

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

                /// TITLE
                Text(
                  "Enter 7 digit pin",
                  style: TextStyle(
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff514B4B),
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// UPDATED INPUT FIELD
                TextFormField(
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  maxLength: 7,
                  textAlign: TextAlign.center, // CENTER TEXT

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // WHITE BACKGROUND

                    hintText: "Enter PIN",
                    counterText: "",

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black, // 1PX BORDER COLOR
                        width: 1,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black, // FOCUSED BORDER COLOR
                        width: 1,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  /// VALIDATION RULES
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "PIN cannot be empty";
                    }
                    if (value.length != 7) {
                      return "PIN must be exactly 7 digits";
                    }
                    return null;
                  },
                ),

                SizedBox(height: h * 0.03),

                /// VERIFY BUTTON
                SizedBox(
                  width: double.infinity,
                  height: h * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFEBE01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.go("/");
                      }
                    },

                    child: Text(
                      "Verify",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: w * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
