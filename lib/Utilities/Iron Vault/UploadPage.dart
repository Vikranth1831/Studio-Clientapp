import 'dart:math';
import 'package:flutter/material.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';

class UploadPage extends StatefulWidget {
  final String fileType;
  const UploadPage({super.key, required this.fileType});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String? fileName;
  double? fileSizeMB;

  // mock file upload
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
        leading: BackButton(color: Colors.white),
        title: Text(
          "Upload ${widget.fileType.toUpperCase()}",
          style: const TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
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
                // TOP HEADING
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

                // SUB TEXT
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
                Icon(
                  Icons.insert_drive_file_rounded,
                  color: Colors.white70,
                  size: w * 0.13,
                ),

                SizedBox(height: h * 0.015),

                // SHOW FILE NAME + SIZE IF UPLOADED
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
                  // SHOW DROP AREA TEXTS
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

                // BUTTONS BASED ON STATE
                if (fileName == null) ...[
                  SizedBox(
                    width: w * 0.6,
                    height: h * 0.055,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: pickFile,
                      child: Text(
                        "Upload Document",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // CANCEL OUTLINED
                      SizedBox(
                        width: w * 0.33,
                        height: h * 0.052,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              fileName = null;
                              fileSizeMB = null;
                            });
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // UPLOAD (FILLED)
                      SizedBox(
                        width: w * 0.40,
                        height: h * 0.052,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Upload Document",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
              ],
            ),
          ),

          SizedBox(height: h * 0.02),

          // BOTTOM TEXT OUTSIDE CONTAINER
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.15),
            child: Text(
              "Files Are Encrypted and Stored securely. "
                  "Once uploaded they cannot be previewed For your security",
              style: TextStyle(color: Colors.white70, fontSize: w * 0.035),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
