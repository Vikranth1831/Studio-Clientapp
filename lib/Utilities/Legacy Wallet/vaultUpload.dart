import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonLegacyUpload extends StatefulWidget {
  final String fromPath;          // where user came from
  final String appBarTitle;
  final String uploadHeading;
  final String uploadInfoText;
  final String buttonText;
  final String nextPath;

  const CommonLegacyUpload({
    super.key,
    required this.fromPath,
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
  final TextEditingController fileNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // Condition if coming from general files page
    final bool showFileNameField = (widget.fromPath == "/general-files");

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            context.push(widget.fromPath);
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h * 0.03),

              // Upload Box (Always Visible)
              Container(
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

              // 🔥 Filename field AFTER upload container
              if (showFileNameField) ...[
                SizedBox(height: h * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "File Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                SizedBox(
                  width: w * 0.9,
                  child: TextField(
                    controller: fileNameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter File Name",
                      hintStyle: const TextStyle(color: Colors.white60),
                      filled: true,
                      fillColor: Colors.white10,

                      // Rectangle border with 4px radius
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.white38),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.white38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              if (showFileNameField) {
                context.go(widget.fromPath);
              } else {
                context.push(widget.nextPath);
              }
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
