import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewImagePage extends StatelessWidget {
  final Map<String, String> img;

  const ViewImagePage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;


    final String name = img["name"] ?? "Unnamed File";
    final String path = img["path"] ?? "";

    if (path.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            "Image path is empty!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,



      body: Column(
        children: [
          Container(
            height: h * 0.05,
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Iron Vault",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Image.asset(
                path,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffD4AF37),
                minimumSize: Size(double.infinity, 36),
              ),
              onPressed: () => context.pop(),
              child: Text("Go Back", style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
