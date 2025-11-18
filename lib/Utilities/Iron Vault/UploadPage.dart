import 'package:flutter/material.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:go_router/go_router.dart';

class UploadPage extends StatefulWidget {
  final String fileType;
  const UploadPage({super.key, required this.fileType});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String? fileName;
  double? fileSizeMB;

  // Mock upload method
  void pickFile() {
    setState(() {
      fileName = "Frame_241111.png";
      fileSizeMB = 2.24;
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
        title: Text(
          "Upload ${widget.fileType.toUpperCase()}",
          style: const TextStyle(color: Colors.white),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // MAIN UPLOAD CONTAINER
            Container(
              width: w * 0.85,
              padding: EdgeInsets.symmetric(
                vertical: h * 0.03,
                horizontal: w * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white70, width: 1.3),
              ),

              child: Column(
                children: [
                  // TOP TITLE
                  Text(
                    "Uploaded High Security Document",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: h * 0.008),

                  // SUBTEXT
                  Text(
                    "Encrypted and Hidden After Upload",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: w * 0.034,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: h * 0.03),

                  // FILE ICON
                  Image.asset('assets/icons/File.png',
                    width: w * 0.14,),

                  SizedBox(height: h * 0.015),

                  // FILE DETAILS IF UPLOADED
                  if (fileName != null) ...[
                    Text(
                      fileName!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: w * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: h * 0.005),

                    Text(
                      "${fileSizeMB!.toStringAsFixed(2)} MB",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: w * 0.036,
                      ),
                    ),

                    SizedBox(height: h * 0.02),
                  ] else ...[
                    // DROP FILE TEXT
                    Text(
                      "Drop Your File here",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: w * 0.038,
                      ),
                    ),

                    SizedBox(height: h * 0.005),

                    Text(
                      "Or",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: w * 0.038,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: h * 0.02),
                  ],

                  // BUTTONS
                  if (fileName == null) ...[
                    SizedBox(
                      width: w * 0.7,
                      height: h * 0.055,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: pickFile,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/UploadSimple.png',
                              height: h * 0.035,
                              width: w * 0.035,
                            ),
                            SizedBox(width: w * 0.03),
                            Text(
                              "Upload Document",
                              style: TextStyle(
                                color: Color(0xff624A4A),
                                fontSize: w * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: h * 0.045,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xffDDD3D3)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                fileName = null;
                                fileSizeMB = null;
                              });
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Color(0xffD2B4B4)),
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            context.push("/viewDocument");
                          },

                          child: SizedBox(
                            height: h * 0.045,
                            child: Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFEBE01),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),

                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/UploadSimple.png',
                                      height: h * 0.032,
                                      width: w * 0.032,
                                    ),
                                    SizedBox(width: w * 0.02),
                                    Text(
                                      "Upload Document",
                                      style: TextStyle(
                                        color: Color(0xff624A4A),
                                        fontSize: w * 0.035,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(height: h * 0.02),

            // SECURITY TEXT
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.12),
              child: Text(
                "Files Are Encrypted and Stored securely. "
                "Once uploaded they cannot be previewed for your security",
                style: TextStyle(color: Colors.white70, fontSize: w * 0.035),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
