import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DownloadEvent extends StatefulWidget {
  const DownloadEvent({super.key});

  @override
  State<DownloadEvent> createState() => _DownloadEventState();
}

class _DownloadEventState extends State<DownloadEvent> {
  Set<String> selectedEvents = {};
  bool showConfirm = false;
  int step = 1;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Download',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 1.40,
              ),
            ),

            SizedBox(height: h * 0.05),

            Expanded(
              child: Center(
                child: step == 1
                    ? DownloadEventWidget(
                  width: w,
                  height: h,
                  selectedEvents: selectedEvents,
                  onToggleEvent: (event) {
                    setState(() {
                      if (selectedEvents.contains(event)) {
                        selectedEvents.remove(event);
                      } else {
                        selectedEvents.add(event);
                      }
                    });
                  },
                  onDownload: () {
                    setState(() => step = 2);   // go to confirm
                  },
                )
                    : step == 2
                    ? DownloadConfirmWidget(
                  width: w,
                  height: h,
                  onNo: () {
                    setState(() => step = 1);
                  },
                  onYes: () {
                    setState(() => step = 3);  // go to verified
                  },
                )
                    : DownloadVerifiedWidget(
                  width: w,
                  height: h,
                  onOkay: () {
                    setState(() => step = 1);  // reset back to first
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget DownloadVerifiedWidget({
    required double width,
    required double height,
    required VoidCallback onOkay,
  }) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // IMAGE + TEXTS
          SizedBox(
            width: width * 0.35,        // ✅ FIX: Wider container for layout
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // IMAGE
                SizedBox(
                  width: width * 0.10,
                  height: width * 0.10,
                  child: Image.asset(
                    "assets/images/successgreen.png",
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: height * 0.02),

                // TITLE
                Text(
                  "Verified",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.018,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.10,
                  ),
                ),

                SizedBox(height: height * 0.01),

                // SUBTITLE
                Text(
                  "Download will start automatically",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFA7A7A7),
                    fontSize: width * 0.012,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.10,
                  ),
                ),
                SizedBox(height: height * 0.02,),
                GestureDetector(
                  //onTap: onOkay,
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.09,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFEBE01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Okay",
                        style: TextStyle(
                          color: const Color(0xFF222222),
                          fontSize: width * 0.013,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
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




  Widget DownloadEventWidget({
    required double width,
    required double height,
    required Set<String> selectedEvents,
    required VoidCallback onDownload,
    required Function(String event) onToggleEvent,
  }) {
    final List<String> events = [
      "Prewedding",
      "Engagement",
      "Marriage",
      "Reception",
    ];

    return Container(
      width: width * 0.35,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.03,
      ),
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // PNG IMAGE
          SizedBox(
            width: width * 0.20,
            height: height * 0.18,
            child: Image.asset(
              "assets/images/download_event.png",
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: height * 0.03),

          // TITLE
          Text(
            "Select Download Event",
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.015,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
              letterSpacing: 0.32,
            ),
          ),

          SizedBox(height: height * 0.03),

          // CHECKBOX LIST
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: events.map((event) {
              final isSelected = selectedEvents.contains(event);

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => onToggleEvent(event),
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                          color: isSelected ? Colors.yellow : Colors.transparent,
                        ),
                        child: isSelected
                            ? Icon(Icons.check, size: 18, color: Colors.black)
                            : null,
                      ),
                    ),

                    SizedBox(width: 10),

                    Text(
                      event,
                      style: TextStyle(
                        color: const Color(0xFFEDEDED),
                        fontSize: width * 0.012,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          SizedBox(height: height * 0.04),

          // BUTTON
          GestureDetector(
            onTap: onDownload,
            child: Container(
              width: double.infinity,
              height: height * 0.06,
              decoration: ShapeDecoration(
                color: const Color(0xFFFEBE01),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Center(
                child: Text(
                  "Start Download",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.013,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget DownloadConfirmWidget({
    required double width,
    required double height,
    required VoidCallback onYes,
    required VoidCallback onNo,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Inner card
          Container(
            width: width * 0.30,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Column(
              children: [
                // MAIN TEXT
                Text(
                  "You can download only once\nfor free",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.015,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.32,
                  ),
                ),

                SizedBox(height: height * 0.02),

                Text(
                  "Are you sure to download it",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFEDEDED),
                    fontSize: width * 0.012,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.26,
                  ),
                ),

                SizedBox(height: height * 0.03),

                // BUTTONS ROW
                Row(
                  children: [
                    // NO
                    Expanded(
                      child: GestureDetector(
                        onTap: onNo,
                        child: Container(
                          height: height * 0.055,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFFFEBE01),
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "No",
                              style: TextStyle(
                                color: const Color(0xFFFEBE01),
                                fontSize: width * 0.013,
                                fontFamily: 'Segoe UI',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 24),

                    // YES
                    Expanded(
                      child: GestureDetector(
                        onTap: onYes,
                        child: Container(
                          height: height * 0.055,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFEBE01),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.013,
                                fontFamily: 'Segoe UI',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
