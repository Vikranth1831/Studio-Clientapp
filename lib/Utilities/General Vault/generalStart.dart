import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GeneralVaultStart extends StatefulWidget {
  const GeneralVaultStart({super.key});

  @override
  State<GeneralVaultStart> createState() => _GeneralVaultStartState();
}

class _GeneralVaultStartState extends State<GeneralVaultStart> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height; final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Folder Icon
              Image.asset( 'assets/images/Folder.png', height: h * 0.18, ), SizedBox(height: h * 0.03),

              const SizedBox(height: 20),

              // Main Title
              const Text(
                "General Vault",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "Your personal upload space\nStart using with simple OTP verification",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 120),

              // Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      context.push("/upload-new",);
                    },
                    child: const Text(
                      "New Upload",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
