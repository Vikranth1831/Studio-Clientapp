import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UtilHome extends StatefulWidget {
  const UtilHome({super.key});

  @override
  State<UtilHome> createState() => _UtilHomeState();
}

class _UtilHomeState extends State<UtilHome> {
  @override
  Widget build(BuildContext context) {
    final double h = SizeConfig.screenHeight;
    final double w = SizeConfig.screenWidth;
    bool isWeb = AppResponsive.isDesktop(context);


    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(h, w, isWeb),

        body: isWeb
            ? Padding(
              padding:  EdgeInsets.all(isWeb ? 12 : 0),
              child: Center(
                child:
                Column(
                  children: [
                   SizedBox(height: h * 0.1,),
                    Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                    Expanded(
                      flex: 1,
                      child: ShowImage('assets/images/Dataimage.png', h, w,isWeb),
                    ),
                    SizedBox(width: w * 0.03),
                    Expanded(
                      flex: 1,
                      child: GridContainer(h, w,isWeb),
                    ),
                              ],
                            ),
                  ],
                ),
              ),
            )
            : SingleChildScrollView(
              child: Column(
                        children: [
              ShowImage('assets/images/Dataimage.png', h, w,isWeb),
              SizedBox(height: h * 0.015),
              GridContainer(h, w,isWeb),
                          SizedBox(height: h * 0.02),
                        ],
                      ),
            ),

      ),
    );
  }
  Widget GridContainer(var h, var w, bool isweb) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),

          /// COLUMN → MOBILE
          /// FLEXIBLE COLUMN → WEB (prevents overflow)
          child: isweb
              ? Padding(
                padding: const EdgeInsets.all(0),
                child: Flexible(
                            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // ROW 1
                  Row(
                    children: [
                      vaultButton(
                        title: "ID Vault",
                        icon: "assets/icons/Lock.png",
                        bgColor: const Color(0xFFFEBE01),
                        onTap: () => context.push('/id-vault'),
                        w: w,
                        h: h,
                        isweb: isweb,
                      ),
                      vaultButton(
                        title: "Iron Vault",
                        icon: "assets/icons/Shield.png",
                        bgColor: const Color(0xFFFFF9E6),
                        onTap: () => context.push('/iron-vault'),
                        w: w,
                        h: h,
                        isweb: isweb,
                      ),
                    ],
                  ),

                  // ROW 2
                  Row(
                    children: [
                      vaultButton(
                        title: "General Vault",
                        icon: "assets/icons/Folder.png",
                        bgColor: const Color(0xFFFFF9E6),
                        onTap: () => context.push('/general-vault'),
                        w: w,
                        h: h,
                        isweb: isweb,
                      ),
                      vaultButton(
                        title: "Legacy Vault",
                        icon: "assets/icons/Vector.png",
                        bgColor: const Color(0xFFFEBE01),
                        onTap: () => context.push('/legacy-vault'),
                        w: w,
                        h: h,
                        isweb: isweb,
                      ),
                    ],
                  ),

                  // ROW 3
                  Row(
                    children: [
                      vaultButton(
                        title: "E-books",
                        icon: "assets/icons/Books.png",
                        bgColor: const Color(0xFFFEBE01),
                        onTap: () => context.push('/ebooks'),
                        w: w,
                        h: h,
                        isweb: isweb,
                      ),
                      vaultButton(
                        title: "Download",
                        icon: "assets/icons/DownloadSimple.png",
                        bgColor: const Color(0xFFFFF9E6),
                        onTap: () => context.push('/download-history'),
                        w: w,
                        h: h,
                        isweb: isweb,
                      ),
                    ],
                  ),
                ],
                            ),
                          ),
              )

          /// MOBILE LAYOUT (NO CHANGE)
              : SingleChildScrollView(
                child: Column(
                            children: [
                // ROW 1
                Row(
                  children: [
                    vaultButton(
                      title: "ID Vault",
                      icon: "assets/icons/Lock.png",
                      bgColor: const Color(0xFFFEBE01),
                      onTap: () => context.push('/id-vault'),
                      w: w,
                      h: h,
                      isweb: isweb,
                    ),
                    vaultButton(
                      title: "Iron Vault",
                      icon: "assets/icons/Shield.png",
                      bgColor: const Color(0xFFFFF9E6),
                      onTap: () => context.push('/iron-vault'),
                      w: w,
                      h: h,
                      isweb: isweb,
                    ),
                  ],
                ),

                // ROW 2
                Row(
                  children: [
                    vaultButton(
                      title: "General Vault",
                      icon: "assets/icons/Folder.png",
                      bgColor: const Color(0xFFFFF9E6),
                      onTap: () => context.push('/general-vault'),
                      w: w,
                      h: h,
                      isweb: isweb,
                    ),
                    vaultButton(
                      title: "Legacy Vault",
                      icon: "assets/icons/Vector.png",
                      bgColor: const Color(0xFFFEBE01),
                      onTap: () => context.push('/legacy-vault'),
                      w: w,
                      h: h,
                      isweb: isweb,
                    ),
                  ],
                ),

                // ROW 3
                Row(
                  children: [
                    vaultButton(
                      title: "E-books",
                      icon: "assets/icons/Books.png",
                      bgColor: const Color(0xFFFEBE01),
                      onTap: () => context.push('/ebooks'),
                      w: w,
                      h: h,
                      isweb: isweb,
                    ),
                    vaultButton(
                      title: "Download",
                      icon: "assets/icons/DownloadSimple.png",
                      bgColor: const Color(0xFFFFF9E6),
                      onTap: () => context.push('/download-history'),
                      w: w,
                      h: h,
                      isweb: isweb,
                    ),
                  ],
                ),
                            ],
                          ),
              ),
        ),
      ),
    );
  }


  Widget ShowImage(String path,var h,var w,bool isweb)
  {
    return  Container(
      child: Image.asset('assets/images/Dataimage.png'),
      height:  (isweb) ? h * 0.6 :  h * 0.4,
      width: (isweb) ? w * 0.3 :  w * 0.5,
    );
  }
}

/// ---------------------------------------------------------------------
/// UPDATED VAULT BUTTON (PNG ONLY — NO SVG, NO TINT)
/// ---------------------------------------------------------------------

Widget vaultButton({
  required String title,
  required String icon,
  required Color bgColor,
  required Function() onTap,
  required double w,
  required double h,
  required bool isweb,
}) {
  // RESPONSIVE SIZES
  double boxHeight = isweb ? 120 : h * 0.12;
  double iconSize = isweb ? 40 : w * 0.085;
  double fontSize = isweb ? 16 : w * 0.04;

  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: boxHeight,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 6),

            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

 
PreferredSizeWidget CustomAppBar(double h, double w, bool isWeb) {
  return PreferredSize(
    preferredSize: Size.fromHeight(h * 0.13),
    child: Container(
      width: w,
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.04,
        vertical: h * 0.018,
      ),
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        children: [
          /// LEFT TEXTS
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Utility',
                style: TextStyle(
                  color:  Colors.white,
                  fontSize: (isWeb) ? w * 0.02 : w * 0.07,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),


            ],
          ),

        ],
      ),
    ),
  );
}

/// ---------------------------------------------------------------------
/// CUSTOM APP BAR (PNG ICON ADDED INSTEAD OF SVG)
/// ---------------------------------------------------------------------


