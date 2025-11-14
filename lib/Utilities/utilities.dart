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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(h: h, w: w),

        body: Column(
          children: [
            /// TOP IMAGE
            Container(
              child: Image.asset('assets/images/Dataimage.png'),
              height: h * 0.4,
              width: w * 1,
            ),

            SizedBox(height: h * 0.03),

            /// GRID CONTAINER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    children: [
                      /// ROW 1
                      Row(
                        children: [
                          vaultButton(
                            title: "ID Vault",
                            icon: "assets/icons/Lock.png",
                            bgColor: const Color(0xFFFEBE01),
                            onTap: () {
                              context.push('/id-vault');
                            },
                            w: w,
                            h: h,
                          ),
                          vaultButton(
                            title: "Iron Vault",
                            icon: "assets/icons/Shield.png",
                            bgColor: const Color(0xFFFFF9E6),
                            onTap: () {
                              context.push('/iron-vault');
                            },
                            w: w,
                            h: h,
                          ),
                        ],
                      ),

                      /// ROW 2
                      Row(
                        children: [
                          vaultButton(
                            title: "General Vault",
                            icon: "assets/icons/Folder.png",
                            bgColor: const Color(0xFFFFF9E6),
                            onTap: () {
                              context.push('/general-vault');
                            },
                            w: w,
                            h: h,
                          ),
                          vaultButton(
                            title: "Legacy Vault",
                            icon: "assets/icons/Vector.png",
                            bgColor: const Color(0xFFFEBE01),
                            onTap: () {
                              context.push('/legacy-vault');
                            },
                            w: w,
                            h: h,
                          ),
                        ],
                      ),

                      /// ROW 3
                      Row(
                        children: [
                          vaultButton(
                            title: "E-books",
                            icon: "assets/icons/Books.png",
                            bgColor: const Color(0xFFFEBE01),
                            onTap: () {
                              context.push('/ebooks');
                            },
                            w: w,
                            h: h,
                          ),
                          vaultButton(
                            title: "Download",
                            icon: "assets/icons/DownloadSimple.png",
                            bgColor: const Color(0xFFFFF9E6),
                            onTap: () {
                              context.push('/download-history');
                            },
                            w: w,
                            h: h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: h * 0.12,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// PNG ICON WITHOUT COLOR FILTER
            Image.asset(
              icon,
              width: w * 0.085,
              height: w * 0.085,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 6),

            /// TEXT
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: w * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// ---------------------------------------------------------------------
/// CUSTOM APP BAR (PNG ICON ADDED INSTEAD OF SVG)
/// ---------------------------------------------------------------------

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double h;
  final double w;

  const CustomAppBar({super.key, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.018),
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        children: [
          /// LEFT SIDE TITLE
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Studio App',
                style: TextStyle(
                  color: const Color(0xFFFEBE01),
                  fontSize: w * 0.065,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Dphotowala Studio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: w * 0.034,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const Spacer(),

          /// NOTIFICATION BUTTON (PNG)
          // Container(
          //   width: w * 0.09,
          //   height: w * 0.09,
          //   decoration: ShapeDecoration(
          //     shape: RoundedRectangleBorder(
          //       side: const BorderSide(
          //         width: 1,
          //         color: Color(0xFF372901),
          //       ),
          //       borderRadius: BorderRadius.circular(50),
          //     ),
          //   ),
          //   child: Center(
          //     child: SizedBox(
          //       width: w * 0.06,
          //       height: w * 0.06,
          //       child: Image.asset(
          //         '',
          //         fit: BoxFit.contain,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(h * 0.11);
}
