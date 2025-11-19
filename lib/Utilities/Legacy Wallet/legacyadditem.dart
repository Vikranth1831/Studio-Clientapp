import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LegacyAddImage extends StatefulWidget {
  const LegacyAddImage({super.key});

  @override
  State<LegacyAddImage> createState() => _LegacyAddImageState();
}

class _LegacyAddImageState extends State<LegacyAddImage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
        title: const Text(
          "Upload Images Here",
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      // ---------------- BODY ----------------
      body: Center(
        child: Container(
          height: h * .32,
          width: w * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xff4D4D4D)),

          ),
          padding: const EdgeInsets.fromLTRB(10,24,10,24),

          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Heading
              const Text(
                "Upload Legacy Image",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,

                  color: Color(0xffDFDFDF),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: h * 0.02),

              // Inner Upload Container
              Container(
                height: h * 0.18,
                width: w * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white38),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Image.asset('assets/icons/Upload.png',
                      width: 32,
                      height: 32,
                    ),

                    SizedBox(height: 8),

                    Text(
                      "Tap to Upload Image",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Color(0xff7E7E7E),
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "JPG,PNG, (MAX,12 MB)",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Color(0xffAE9090),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ---------------- BOTTOM BUTTON ----------------
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),

          child: ElevatedButton(
            onPressed: () {
              context.push( "/upload-success");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFEBE01), // gold
              minimumSize: Size(double.infinity, h * 0.065),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: const Text(
              "Upload",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
