import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonLegacyUpload extends StatefulWidget {
  final String fromPath;        // NEW
  final String appBarTitle;
  final String uploadHeading;
  final String uploadInfoText;
  final String buttonText;
  final String nextPath;

  const CommonLegacyUpload({
    super.key,
    required this.fromPath,     // NEW
    required this.appBarTitle,
    required this.uploadHeading,
    required this.uploadInfoText,
    required this.buttonText,
    required this.nextPath,
  });

  @override
  State<CommonLegacyUpload> createState() => _CommonLegacyUploadState();
}

class _CommonLegacyUploadState extends State<CommonLegacyUpload> {
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
            // If coming from a specific screen → go back to that screen
            context.go(widget.fromPath);
          },
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          height: h * .32,
          width: w * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xff4D4D4D)),
          ),
          padding: const EdgeInsets.fromLTRB(10, 24, 10, 24),

          child: Column(
            children: [
              Text(
                widget.uploadHeading,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  color: Color(0xffDFDFDF),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: h * 0.02),

              Container(
                height: h * 0.18,
                width: w * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white38),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_upload_outlined, size: 32, color: Colors.white),
                    const SizedBox(height: 8),
                    const Text(
                      "Tap to Upload Image",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        color: Color(0xff7E7E7E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.uploadInfoText,
                      style: const TextStyle(
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

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              context.push(widget.nextPath); // Dynamic navigation after upload
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFEBE01),
              minimumSize: Size(double.infinity, h * 0.065),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Text(
              widget.buttonText,
              style: const TextStyle(
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
