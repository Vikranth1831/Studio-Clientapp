import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ------------------- Title -------------------
            const Text(
              "The Homeric Hymns",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: h * 0.02),

            /// ------------------- Book Image -------------------
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

            /// ------------------- Chapter Title -------------------
            const Text(
              "Chapter 1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: h * 0.015),

            /// ------------------- Description -------------------
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

            /// ------------------- Buttons -------------------
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Last Page Button
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
              
                  /// Next Page Button
                  SafeArea(
                    child: Container(
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
