import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Viewbook extends StatefulWidget {
  const Viewbook({super.key});

  @override
  State<Viewbook> createState() => _ViewbookState();
}

class _ViewbookState extends State<Viewbook> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool isweb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () =>context.go('/dashboard'),
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
      ),

      /// ------------------ WEB LAYOUT (2 COLUMN) ------------------
      body: isweb
          ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              /// ------------------- LEFT COLUMN -------------------
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    const Text(
                      "The Homeric Hymns",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          
                    SizedBox(height: h * 0.03),
          
                    /// Book Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/Mask group.png",
                        height: h * 0.6,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
          
              SizedBox(width: 40),
          
              /// ------------------- RIGHT COLUMN -------------------
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Chapter
                    const Text(
                      "Chapter 1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
          
                    SizedBox(height: h * 0.02),
          
                    /// Description
                 SingleChildScrollView(
                        child: Text(
                          "With fair-tressed Demeter, the sacred goddess, my song begins. "
                              "With herself and her slim-ankled daughter, whom Aidoneus once "
                              "abducted. Most people are familiar, at least by repute, with "
                              "the two great epics of Homer, the Iliad and the Odyssey, "
                              "but few are aware that other poems survive that were attributed "
                              "to Homer in ancient times. The Homeric Hymns are now known to be "
                              "the work of various poets working in the same tradition, probably "
                              "during the seventh and sixth centuries BC.",
                          style: TextStyle(
                            color: Colors.white70,
                            height: 1.5,
                            fontSize: 16,
                          ),
                          maxLines: 9,
                        ),
          
                    ),
          
                   SizedBox(height: h * 0.1),
          
                    /// Buttons
                    Row(
                      children: [
                        /// Last Page
                        Container(
                          height: 45,
                          width: (w * 0.16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2D2D2D),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              "Last Page",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
          
                        SizedBox(width: 25),
          
                        /// Next Page
                        Container(
                          height: 45,
                          width: (w * 0.16),
                          decoration: BoxDecoration(
                            color: Color(0xFFFEBE01),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              "Next Page",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
          
                    SizedBox(height: h * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      )

      /// ------------------ MOBILE LAYOUT (UNCHANGED) ------------------
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "The Homeric Hymns",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: h * 0.02),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/Mask group.png",
                height: h * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: h * 0.03),

            const Text(
              "Chapter 1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: h * 0.015),

            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "With fair-tressed Demeter, the sacred goddess, my song begins. "
                      "With herself and her slim-ankled daughter, whom Aidoneus once "
                      "abducted. Most people are familiar, at least by repute, with "
                      "the two great epics of Homer, the Iliad and the Odyssey, "
                      "but few are aware that other poems survive that were attributed "
                      "to Homer in ancient times. The Homeric Hymns are now known to be "
                      "the work of various poets working in the same tradition, probably "
                      "during the seventh and sixth centuries BC.",
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.5,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            SizedBox(height: h * 0.02),

            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: w * 0.44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D2D2D),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        "Last Page",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: w * 0.44,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEBE01),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        "Next Page",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.02),
          ],
        ),
      ),
    );
  }
}

