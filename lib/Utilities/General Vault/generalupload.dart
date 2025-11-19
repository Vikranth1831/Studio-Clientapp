import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dotted_border/dotted_border.dart';

class Generalupload extends StatefulWidget {
  const Generalupload({super.key});

  @override
  State<Generalupload> createState() => _GeneraluploadState();
}

class _GeneraluploadState extends State<Generalupload> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,

        leading: GestureDetector(
          onTap: () => context.pop(),        // ★ Using GoRouter pop()
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),

        title: const Text(
          "The General Vault",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ---------------- BODY ----------------
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ---------- Uploads Text ----------
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Uploads",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: h * 0.08),

          // ---------- Center Content ----------
          Center(
            child: Column(
              children: [
                // Center Image
                Image.asset(
                  "assets/images/newupload.png",
                  height: h * 0.25,
                  width: h * 0.25,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: h * 0.1),

                // ---------- DOTTED BORDER UPLOAD BUTTON ----------
                GestureDetector(
                  onTap: () {
                    context.push('/otp');   // ★ Using GoRouter push()
                  },
                  child: DottedBorder(
                    color: const Color(0xffFEBE01),         // Gold
                    dashPattern: const [6, 4],
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(4),

                    child: Container(
                      height: h * 0.12,
                      width: w * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),

                      child: const Center(
                        child: Text(
                          "Upload New File",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
