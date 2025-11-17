import 'package:clientapp_studio/Components/CutomAppBar.dart';
import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetMenu extends StatefulWidget {
  const SetMenu({super.key});

  @override
  State<SetMenu> createState() => _SetMenuState();
}

class _SetMenuState extends State<SetMenu> {
  // Dummy icon paths (SVG + PNG)
  final List<Map<String, dynamic>> menuItems = [
    {"svg": "assets/icons/img.png", "title": "View GST Bill", "onTap": () {}},
    {"svg": "assets/icons/storage.png", "title": "Storage", "sub": "10 GB free / 100 GB total", "onTap": () {}},
    {"svg": "assets/icons/refresh.png", "title": "Renew / Revise Plan", "onTap": () {}},
    {"svg": "assets/icons/call.png", "title": "Call Studio", "onTap": () {}},
    {"svg": "assets/icons/image 4.png", "title": "Change Email", "onTap": () {}},
    {"svg": "assets/icons/Group 1.png", "title": "Managed Trusted Device", "onTap": () {}},
    {"svg": "assets/icons/image 6.png", "title": "Logout From All Device", "onTap": () {}},
    {"svg": "assets/icons/image 7.png", "title": "Parental Controls for OTT", "onTap": () {}},
    {"svg": "assets/icons/CloudArrowDown.png", "title": "Download History", "onTap": () {}},
    {"svg": "assets/icons/image 8.png", "title": "Help & Support", "onTap": () {}},
    {"svg": "assets/icons/image 12.png", "title": "Logout /Switch User", "onTap": () {}},
    {"svg": "assets/icons/image 383.png", "title": "Delete Account", "onTap": () {}},
  ];

  // Function to detect and load SVG or PNG
  Widget _buildIcon(String path, double size) {
    if (path.endsWith(".svg")) {
      return SvgPicture.asset(
        path,
        width: size,
        height: size,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    } else {
      return Image.asset(
        path,
        width: size,
        height: size,
        color: Colors.white, // Makes PNG white (optional)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool isWeb=AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar1(title: 'Settings', actions: [], issetting: true,isdocuments: false,),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.015),
        child: Column(
          children: List.generate(menuItems.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: h * 0.015),
              child: InkWell(
                onTap: menuItems[index]["onTap"],
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04,
                      vertical: (isWeb) ? h * 0.0 :  h * 0.018),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // AUTO PNG + SVG Loader
                      _buildIcon(menuItems[index]["svg"], w * 0.065),

                      SizedBox(width: w * 0.04),

                      // TITLE
                      Expanded(
                        child: Text(
                          menuItems[index]["title"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      // SUBTEXT at right end
                      if (menuItems[index]["sub"] != null)
                        Text(
                          menuItems[index]["sub"],
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 11 ,
                          ),
                          textAlign: TextAlign.end,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
