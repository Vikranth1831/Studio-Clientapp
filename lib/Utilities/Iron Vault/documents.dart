import 'package:clientapp_studio/Components/CutomAppBar.dart';
import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VaultDocs extends StatefulWidget {
  const VaultDocs({super.key});

  @override
  State<VaultDocs> createState() => _VaultDocsState();
}

class _VaultDocsState extends State<VaultDocs> {
  /// -------------------------
  /// DYNAMIC DOCUMENT LIST
  /// -------------------------
  List<Map<String, String>> documents = [
    {
      "name": "Passport Copy",
      "type": "PDF",
      "date": "12 Nov 2025",
      "size": "1.2 MB",
      "file": "assets/docs/passport.pdf",
    },
    {
      "name": "Passport Copy",
      "type": "PDF",
      "date": "12 Nov 2025",
      "size": "1.2 MB",
      "file": "assets/docs/passport.pdf",
    },
    {
      "name": "Passport Copy",
      "type": "PDF",
      "date": "12 Nov 2025",
      "size": "1.2 MB",
      "file": "assets/docs/passport.pdf",
    },
    {
      "name": "Passport Copy",
      "type": "PDF",
      "date": "12 Nov 2025",
      "size": "1.2 MB",
      "file": "assets/docs/passport.pdf",
    },
    {
      "name": "Passport Copy",
      "type": "PDF",
      "date": "12 Nov 2025",
      "size": "1.2 MB",
      "file": "assets/docs/passport.pdf",
    },
    {
      "name": "Bank Statement",
      "type": "PDF",
      "date": "10 Nov 2025",
      "size": "980 KB",
      "file": "assets/docs/bank.pdf",
    },
  ];

  /// -------------------------
  /// DYNAMIC IMAGE LIST
  /// -------------------------
  List<Map<String, String>> images = [
    {"name": "Aadhar Card", "path": "assets/images/adhaar.png"},
    {"name": "Pan Card", "path": "assets/images/pan.png"},
    {"name": "License", "path": "assets/images/license.png"},
    {"name": "Office ID", "path": "assets/images/id.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final double h = SizeConfig.screenHeight;
    final double w = SizeConfig.screenWidth;
    bool isWeb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: CustomAppBar1(
        title: 'Iron Vault\nYour Secure PDF & Image Vault ',
        issetting: false,
        isdocuments: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Builder(
              builder: (context) {
                return InkWell(
                  onTap: () {
                    print('addnew file');
                    context.push('/addNewDocument');
                  },
                  child: Container(
                    width: w * 0.065,
                    height: h * 0.03,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffFBD7D7), width: 1),
                    ),
                    child: const Center(
                      child: Icon(Icons.add, color: Color(0xffFBD7D7)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -----------------------------
            /// HEADING
            /// -----------------------------
            Text(
              "Documents",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: h * 0.02),

            /// -----------------------------
            /// DOCUMENT LIST
            /// -----------------------------
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final doc = documents[index];

                  return InkWell(
                    onTap: () {
                      context.push("/viewDocument", extra: doc);
                    },

                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff2E2E2E),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        children: [
                          /// LEFT ICON
                          Container(
                            width: w * 0.15,
                            height: w * 0.15,
                            decoration: BoxDecoration(
                              color: Color(0xff6B4F2B),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/pdf1.png',
                                height: h * 0.07,
                                width: w * 0.07,
                              ),
                            ),
                          ),

                          SizedBox(width: w * 0.04),

                          /// TEXT COLUMN
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doc["name"] ?? "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "${doc["type"]} | ${doc["date"]} | ${doc["size"]}",
                                  style: TextStyle(
                                    color: Color(0xffCCB58F),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: h * 0.01),

            /// -----------------------------
            /// IMAGES HEADING
            /// -----------------------------
            Text(
              "Images",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            /// -----------------------------
            /// IMAGE GRID VIEW
            /// -----------------------------
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isWeb ? 4 : 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final img = images[index];
                  print(img['name']);
                  print(img['path']);

                  return InkWell(
                    onTap: () {
                      context.push(
                        "/viewImage",
                        extra: {"name": img["name"], "path": img["path"]},
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff2E2E2E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(img["path"]!, fit: BoxFit.cover),
                      ),
                    ),
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
