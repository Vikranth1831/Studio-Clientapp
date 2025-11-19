import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifySuccessful extends StatefulWidget {
  const VerifySuccessful({super.key});

  @override
  State<VerifySuccessful> createState() => _VerifySuccessfulState();
}

class _VerifySuccessfulState extends State<VerifySuccessful>{
  get selectedIndex => null;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// ✅ Center content (Image + Texts)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// ✅ Success image
                      Image.asset(
                        'assets/images/CheckCircle.png', // 👈 change to your image path
                        width: width * 0.5,
                        height: height * 0.25,
                      ),

                      SizedBox(height: height * 0.0),

                      /// ✅ Main heading
                      Text(
                        'Verified',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: height * 0.02),

                      /// ✅ Subtext
                      Text(
                        'Start Uploading Now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: width * 0.045,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ✅ Continue button at bottom (SafeArea respected)
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + height * 0.03,
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
                    onPressed: selectedIndex != -1
                        ? () {
                      context.go('/Documents');
                    }
                        : null,
                    child: Text(
                      "Upload Now",
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
          ),
        ),
      ),
    );
  }
}
