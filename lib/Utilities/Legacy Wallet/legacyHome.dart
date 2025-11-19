import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LegacyWalletHome extends StatefulWidget {
  const LegacyWalletHome({super.key});

  @override
  State<LegacyWalletHome> createState() => _LegacyWalletHomeState();
}

class _LegacyWalletHomeState extends State<LegacyWalletHome> {
  final List<Map<String, String>> images = [
    {"image": 'assets/images/rowimage.png'},
    {"image": 'assets/images/rowimage.png'},
    {"image": 'assets/images/coulpleimage.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back, size: 16, color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Legacy Vault",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push("/add-legacy-item"); // your next page route
            },
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.add_box_outlined,
                color: Color(0xffFBD7D7),
                size: 26,
              ),
            ),
          ),
        ],
      ),

      // ---------------------- BODY ----------------------
      body: Column(
        children: [
          SizedBox(height: h * 0.02),

          // ======= LISTVIEW OF CONTAINERS =======
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              padding: EdgeInsets.only(top: h * 0.01),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    /// 👉 NAVIGATE TO NEXT PAGE
                    context.push('/view-legacy-item',
                        extra: {
                      "image": images[index]["image"],
                    }
                    );
                  },

                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: h * 0.02),
                      height: h * 0.18,
                      width: w * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // FIRST IMAGE WITH BORDER RADIUS
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12), // set radius here
                              child: Image.asset(
                                images[index]["image"]!,
                                height: h * 0.18,
                                width: w * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // SECOND IMAGE WITH BORDER RADIUS
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12), // same radius here
                              child: Image.asset(
                                images[index]["image"]!,
                                height: h * 0.18,
                                width: w * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )

                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
