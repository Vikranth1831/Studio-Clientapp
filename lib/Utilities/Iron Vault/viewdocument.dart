import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewDocumentPage extends StatelessWidget {
  final Map<String, String> doc;

  const ViewDocumentPage({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    final bool isTablet = w >= 600 && w < 1100;
    final bool isDesktop = w >= 1100;

    /// FONT SIZE HANDLING
    double titleFont = isDesktop ? 26 : (isTablet ? 22 : 18);
    double fileNameFont = isDesktop ? 24 : (isTablet ? 20 : 18);

    /// PDF ICON SIZE
    double pdfIconSize = isDesktop
        ? h * 0.4
        : isTablet
        ? h * 0.35
        : h * 0.25;

    /// BUTTON HEIGHT
    double buttonHeight = isDesktop ? 60 : (isTablet ? 55 : 48);

    return Scaffold(
      backgroundColor: Colors.black,

      /// ---------- APP BAR ----------
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Iron Vault",
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: isDesktop, // Center title only on desktop
      ),

      /// ---------- BODY ----------
      body: Column(
        children: [
          SizedBox(height: h * 0.02),

          /// ---------- FILE NAME ----------
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Text(
              doc["name"] ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: fileNameFont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: h * 0.03),

          /// ---------- PDF PREVIEW ----------
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/icons/pdf1.png",
                height: pdfIconSize,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// ---------- GO BACK BUTTON ----------
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.03),
            child: SizedBox(
              width: isDesktop ? w * 0.4 : double.infinity,
              height: buttonHeight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffD4AF37), // Gold
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => context.pop(),
                child: Text(
                  "Go Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: isDesktop ? 20 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
