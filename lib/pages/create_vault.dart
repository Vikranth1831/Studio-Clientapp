import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class CreateVault extends StatelessWidget {
  const CreateVault({super.key});

  @override
  Widget build(BuildContext context) {
    final w=SizeConfig.screenWidth;
    final h=SizeConfig.screenHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ID vault',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              height: 1.40,
            ),
          ),
          Center(
            child: Container(
              width: w* 0.3,
              padding: const EdgeInsets.all(32),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 32,
                children: [

                  // ---------------- IMAGE ----------------
                  Container(
                    width: 160,
                    height: 120,
                    decoration: const BoxDecoration(),
                    child: Image.asset("assets/images/digit_lock.png"),
                  ),

                  // ================================ CREATE PIN ================================
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: [

                      // Title
                      const Text(
                        'Create a 7-Digit PIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Segoe UI',
                          fontWeight: FontWeight.w600,
                          height: 1.20,
                        ),
                      ),

                      // PIN input boxes (editable)
                      Row(
                        spacing: 8,
                        children: List.generate(7, (index) {
                          return Container(
                            width: 30,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),

                  // ================================ CONFIRM PIN ================================
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: [

                      // Title
                      const Text(
                        'Confirm 7-Digit PIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Segoe UI',
                          fontWeight: FontWeight.w600,
                          height: 1.20,
                        ),
                      ),

                      // Confirm PIN Boxes
                      Row(
                        spacing: 8,
                        children: List.generate(7, (index) {
                          return Container(
                            width: 30,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),

                  // ================================ BUTTON ================================
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFEBE01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Create PIN',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
