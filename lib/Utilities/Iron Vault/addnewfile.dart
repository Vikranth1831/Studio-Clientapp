import 'package:clientapp_studio/Components/CutomAppBar.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewDocument extends StatefulWidget {
  const AddNewDocument({super.key});

  @override
  State<AddNewDocument> createState() => _AddNewDocumentState();
}

class _AddNewDocumentState extends State<AddNewDocument> {
  int selectedIndex = -1;

  List<Map<String, String>> categories = [
    {"title": "PDF Documents", "type": "pdf"},
    {"title": "Images", "type": "image"},
    {"title": "Videos", "type": "video"},
    {"title": "Other Files", "type": "other"},
  ];

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: CustomAppBar1(
        title: 'Select Category Type',
        actions: [],
        issetting: false,
        isdocuments: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];

            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },

              child: Container(
                margin: EdgeInsets.only(bottom: h * 0.02),
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.04, vertical: h * 0.02),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedIndex == index
                        ? Colors.amber
                        : Colors.white,
                    width: 1.2,
                  ),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item["title"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    // Circle color changes when selected
                    Container(
                      width: w * 0.05,
                      height: w * 0.05,
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.amber
                            : Color(0xffDBAF73),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      // Continue Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + h * 0.03,
          left: w * 0.08,
          right: w * 0.08,
        ),
        child: SizedBox(
          width: double.infinity,
          height: h * 0.065,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
              selectedIndex == -1 ? Colors.grey : Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: selectedIndex == -1
                ? null
                : () {
              String selectedType = categories[selectedIndex]["type"]!;
              context.push('/uploadPage', extra: selectedType);
            },
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.black,
                fontSize: w * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
