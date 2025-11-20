import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Documentuploads extends StatefulWidget {
  const Documentuploads({super.key});

  @override
  State<Documentuploads> createState() => _DocumentuploadsState();
}

class _DocumentuploadsState extends State<Documentuploads> {

  // Dummy document list
  final List<String> documents = [
    "Pan Card",
    "Aadhar Card",
    "Investment Proofs",
    "Capital Gains",
  ];

  @override
  Widget build(BuildContext context) {
    final double h = SizeConfig.screenHeight;
    final double w = SizeConfig.screenWidth;
    return Scaffold(
      backgroundColor: Colors.black,

      // ------------------ APP BAR ------------------
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "Select Category type",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // ------------------ BODY ------------------
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- TITLE + PLUS BUTTON ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Uploaded Documents",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // OUTLINED CIRCLE + ICON
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Color(0xFFFBD7D7), // outline color
                width: 1,
              ),
              minimumSize: const Size(28, 28), // smaller box
              padding: EdgeInsets.zero, // remove all padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              context.push("/add-document");
            },
            child: const Icon(
              Icons.add,
              size: 16,                 // smaller icon
              color: Color(0xFFFBD7D7), // icon color
            ),
          ),]
            ),

             SizedBox(height: h * 0.01 ),

            // ---------- GRID VIEW OF DOCUMENT CARDS ----------
            Expanded(
              child: GridView.builder(
                itemCount: documents.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8, // FIXED
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card box
                      Container(
                        height: h * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:  Color(0xff6E6E6E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  Center(
                          child: Icon(Icons.insert_drive_file,
                              color: Colors.white, size: 48),
                        ),
                      ),

                       SizedBox(height:h * 0.01),

                      // Title under card
                      Text(
                        documents[index],
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
