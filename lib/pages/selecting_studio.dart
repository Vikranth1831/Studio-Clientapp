
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils/media_query_helper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class SelectingStudio extends StatefulWidget {
  const SelectingStudio({super.key});

  @override
  State<SelectingStudio> createState() => _SelectingStudioState();
}

class _SelectingStudioState extends State<SelectingStudio> {
  int selectedIndex = -1; // -1 means nothing selected

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: h * 0.030),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(height: h * 0.05),

            Center(child: Image.asset('assets/images/link_1.png')),

            SizedBox(height: h * 0.05),

            Text(
              'Link Generated ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: h * 0.03),

            /// 1️⃣ LEFT-ALIGNED TEXT
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select a studio to create an album',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color(0xFFCFCFCF),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: h * 0.03),

            /// LIST OF STUDIOS (3)
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),

                    /// Tap image to select
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index; // ONLY ONE SELECTED
                        });
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(
                            color: const Color(0xFFFEBE01),
                            width: 3,
                          )
                              : null,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/profile_bg.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// 2️⃣ BUTTON (active only when selectedIndex != -1)
            Opacity(
              opacity: selectedIndex == -1 ? 0.4 : 1.0,
              child: IgnorePointer(
                ignoring: selectedIndex == -1, // disable if not selected
                child: InkWell(
                  onTap: () {
                    context.push('/send_studio');
                  },
                  child: Container(
                    height: h * 0.06,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFEBE01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Send to Studio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: h * 0.05),
          ],
        ),
      ),
    );
  }
}

