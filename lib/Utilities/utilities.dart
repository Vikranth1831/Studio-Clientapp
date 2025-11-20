import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            : Column(
                      children: [
            ShowImage('assets/images/Dataimage.png', h * 0.6, w,isWeb),
            SizedBox(height: h * 0.04),
            GridContainer(h, w,isWeb),
                        SizedBox(height: h * 0.02),
                      ],
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
                        onTap: ()
                        {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const DownloadEventSheet(),
                          );

                        },
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
                      onTap: () => context.push('/ironvault', extra: {
                        "image": "assets/images/imagesh.png",
                        "title": "Secure Document Vault",
                        "sub": "Your Sensitive Documents Are Protected with\nMulti layer Security verification",
                        "btn": "Access Iron Vault",
                        "path": '/vaultpin',   // your custom next-page route
                      }),
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
                      onTap: () => context.push('/ironvault', extra: {
                        "image": "assets/images/Folder.png",
                        "title": "General Vault",
                        "sub": "Your personal upload space\nStart Uploading",
                        "btn": "Next",
                          "path":'/upload-new',}),
                      w: w,
                      h: h,
                      isweb: isweb,
                    ),
                    vaultButton(
                      title: "Legacy Vault",
                      icon: "assets/icons/Vector.png",
                      bgColor: const Color(0xFFFEBE01),
                      onTap: () => context.push('/ironvault', extra: {
                        "image": "assets/images/imagesh.png",
                        "title": "Secure Document Vault",
                        "sub": "Your Sensitive Documents Are Protected with\nMulti layer Security verification",
                        "btn": "Access Iron Vault",
                        "path": '/vaultpin',   // your custom next-page route
                      }),
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
                      onTap: ()
                      {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => const DownloadEventSheet(),
                        );

                      },
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

class DownloadEventSheet extends StatefulWidget {
  const DownloadEventSheet({super.key});

  @override
  State<DownloadEventSheet> createState() => _DownloadEventSheetState();
}

class _DownloadEventSheetState extends State<DownloadEventSheet> {
  final List<String> events = [
    "Prewedding",
    "Engagement",
    "Marriage",
    "Reception",
  ];

  /// store selected items
  final Set<String> selectedEvents = {};

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: const BoxDecoration(
          color: Color(0xFFF7F9FE),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ---------- TITLE ----------
            const Text(
              'Select Download Event',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),

            const SizedBox(height: 20),

            /// ---------- CHECKBOX LIST ----------
            ...events.map((e) => _eventItem(e)).toList(),

            const SizedBox(height: 24),

            /// ---------- DOWNLOAD BUTTON ----------
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEBE01),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: selectedEvents.isEmpty
                    ? null
                    : () {
                  Navigator.pop(context, selectedEvents.toList());
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const DownloadConfirmationSheet(),
                  );

                },
                child: const Text(
                  'Start Download',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// ---------- Event item with CHECKBOX ----------
  Widget _eventItem(String title) {
    bool isChecked = selectedEvents.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isChecked) {
            selectedEvents.remove(title);
          } else {
            selectedEvents.add(title);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [

            /// Checkbox
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isChecked ? Colors.black : Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isChecked ? Colors.black : Colors.transparent,
              ),
              child: isChecked
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),

            const SizedBox(width: 12),

            /// Text
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadConfirmationSheet extends StatelessWidget {
  const DownloadConfirmationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: const BoxDecoration(
          color: Color(0xFFF7F9FE),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Icon Placeholder
            SvgPicture.asset('assets/icons/download.svg'),
            const SizedBox(height: 20),

            /// Main Title
            const Text(
              'You can download only once\nfor free',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),

            const SizedBox(height: 12),

            /// Sub text
            const Text(
              'Are you sure to download it?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),

            const SizedBox(height: 32),

            /// Buttons Row
            Row(
              children: [
                /// NO Button
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFFEBE01)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                /// YES Button
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEBE01),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}




/// ---------------------------------------------------------------------
/// CUSTOM APP BAR (PNG ICON ADDED INSTEAD OF SVG)
/// ---------------------------------------------------------------------


