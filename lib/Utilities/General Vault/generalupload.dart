import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dotted_border/dotted_border.dart';

class Generalupload extends StatefulWidget {
  const Generalupload({super.key});

  @override
  State<Generalupload> createState() => _GeneraluploadState();
}

class _GeneraluploadState extends State<Generalupload> {
  @override
  Widget build(BuildContext context) {
    bool isweb=AppResponsive.isDesktop(context);

    // MOBILE VIEW
    if (!isweb) {
      return GeneraluploadMobile(context);
    }

    // TABLET + WEB VIEW
    return GeneraluploadWeb(context);
  }


  Widget GeneraluploadWeb(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black, 
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "The General Vault",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(        // ✅ Prevent overflow
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: w * 0.45,          // 💻 Web content width
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Uploads",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: h * 0.05),

                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/newupload.png",
                          height: h * 0.25,
                          width: h * 0.25,
                          fit: BoxFit.contain,
                        ),

                        SizedBox(height: h * 0.06),

                        GestureDetector(
                          onTap: () {
                            context.push(
                              '/otp',
                              extra: {
                                "isComing": true,
                                "fromPath": "/general-start",
                              },
                            );
                          },
                          child: DottedBorder(
                            color: const Color(0xffFEBE01),
                            dashPattern: const [6, 4],
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(0),
                            child: Container(
                              height: 70,
                              width: w * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Upload New",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget GeneraluploadMobile(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "The General Vault",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Uploads",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: h * 0.2),

          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/newupload.png",
                  height: h * 0.25,
                  width: h * 0.25,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: h * 0.1),

                GestureDetector(
                  onTap: () {
                    context.push(
                      '/otp',
                      extra: {
                        "isComing": true,
                        "fromPath": "/general-start",
                      },
                    );
                  },
                  child: DottedBorder(
                    color: const Color(0xffFEBE01),
                    dashPattern: const [6, 4],
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(0),
                    child: Container(
                      height: h * 0.1,
                      width: w * 0.65,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: const Center(
                        child: Text(
                          "Upload New ",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
