import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                      'assets/images/new.png', // 👈 change to your image path
                      width: width * 0.5,
                      height: height * 0.25,
                    ),

                    SizedBox(height: height * 0.0),

                    /// ✅ Main heading
                    Text(
                      'Payment Successful!',
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
                      'Your subscription plan has been\nsuccessfully activated!',
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
                  onPressed: () {
                    // TODO: Add navigation or action
                    // Example: context.go('/home');
                  },
                  child: Text(
                    "Continue",
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
    );
  }
}
