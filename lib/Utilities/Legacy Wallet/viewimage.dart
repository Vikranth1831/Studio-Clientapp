import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LegacyImageView extends StatefulWidget {
  final String imagePath; // pass image from previous page

  const LegacyImageView({
    super.key,
    required this.imagePath,
  });

  @override
  State<LegacyImageView> createState() => _LegacyImageViewState();
}

class _LegacyImageViewState extends State<LegacyImageView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            context.pop(); // GoRouter pop action
          },
          child: const Icon(
            Icons.arrow_back,
            size: 18,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'View Image',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Inter',
            color: Colors.white,
          ),
        ),
      ),

      body: Column(
        children: [

          // ---------------- IMAGE (60%) ----------------
          SizedBox(
            height: h * 0.60,
            width: w,
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: h * 0.03),

          // ---------------- DETAILS CONTAINER (25%) ----------------
          Container(
            height: h * 0.18,
            width: w * 0.9,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xffEAEAEA),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xffD5BDBD)),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // Upload Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Upload Date",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff5E4A4A),
                      ),
                    ),
                    Text("12-11-2025",
                      style: TextStyle(
                        fontSize: 14,
                        color:Color(0xff5E4A4A),
                      ),
                    ),
                  ],
                ),

                // Upload Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Upload Time",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff5E4A4A),
                      ),
                    ),
                    Text("04:55 PM",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff5E4A4A),
                      ),
                    ),
                  ],
                ),

                // Storage Size
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Storage Size",
                      style: TextStyle(
                        fontSize: 14,
                        color:Color(0xff5E4A4A),
                      ),
                    ),
                    Text("2.4 MB",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff5E4A4A),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
