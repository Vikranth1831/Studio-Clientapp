
import 'dart:io';

import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoDetailsScreen extends StatefulWidget {
  const VideoDetailsScreen({super.key});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  String videoUrl="https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  String? imagepath = "";
  Future<String?> getFile() async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight: 64,
      quality: 75,
    );
    return fileName;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadThumbnail();

  }
  void loadThumbnail() async {
    final path = await getFile();      // wait for result
    setState(() {
      imagepath = path;                // update variable
    });
  }

  @override
  Widget build(BuildContext context) {
    print(imagepath);
    final h=SizeConfig.screenHeight;
    final w=SizeConfig.screenWidth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // optional
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
      )
      ,
      backgroundColor: Colors.black,
      body: Column(
        children: [

          Thumbnail(h, w,videoUrl),
           NameAndDescription(h,w),

        ],
      ),
    );
  }

  Widget Thumbnail(double h, double w,String videoUrl) {
    return imagepath == null || imagepath!.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
      children: [
        InkWell(
          onTap: () {
            context.push(
              '/video_player_screen',
              extra: videoUrl,
            );
            },
          child: Stack(
            children: [

              /// ★ FULL WIDTH THUMBNAIL IMAGE
              SizedBox(
                width: double.infinity,
                child: Image.file(
                  File(imagepath!),
                  width: w,
                  fit: BoxFit.contain,
                ),
              ),

              /// ★ TOP-LEFT SVG ICON (dummy path)
              Positioned(
                right: w * 0.2,
                top: h * 0.015,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: ShapeDecoration(
                    color: Colors.black.withValues(alpha: 0.50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.95),
                    ),
                  ),
                  width: w * 0.1,
                  height: w * 0.1,
                  child: SvgPicture.asset(
                    'assets/icons/cast.svg', // replace this
                    color: Colors.white,
                  ),
                ),
              ),

              Positioned(
                right: w * 0.03,
                top: h * 0.015,
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: ShapeDecoration(
                    color: Colors.black.withValues(alpha: 0.50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.95),
                    ),
                  ),
                  width: w * 0.09,
                  height: w * 0.09,
                  child: SvgPicture.asset(
                    'assets/icons/close.svg', // replace this
                    color: Colors.white,
                  ),
                ),
              ),

              /// ★ CENTER PLAY ICON
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: w * 0.12,
                    height: w * 0.12,
                    decoration: ShapeDecoration(
                      color: Colors.black.withValues(alpha: 0.60),
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1.81,
                          color: const Color(0xFFFEBE01),
                        ),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/play.svg',
                        width: w * 0.06,
                        height: w * 0.06,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: h * 0.03),
      ],
    );
  }




  Widget NameAndDescription(double h, double w) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // -----------------------------------------
        // TITLE + DURATION + HD TAG
        // -----------------------------------------
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shiva & Rani Engagement ',
              style: TextStyle(
                color: Colors.white,
                fontSize: w * 0.05, // 20
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: h * 0.009), // 7.25

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '140 min',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.03, // 10.87
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(width: w * 0.018), // 7.25

                Container(
                  padding: EdgeInsets.all(w * 0.0048), // 1.81
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: w * 0.0024, // 0.91
                        color: Colors.white.withOpacity(0.20),
                      ),
                      borderRadius: BorderRadius.circular(w * 0.0048), // 1.81
                    ),
                  ),
                  child: Text(
                    'HD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.02, // 7.25
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: h * 0.02), // 16


        // -----------------------------------------
        // PLAY BUTTON + DESCRIPTION
        // -----------------------------------------
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PLAY BUTTON
            Container(
              width: double.infinity,
              height: h * 0.06, // 48
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.037, // 14.49
                vertical: h * 0.009,    // 7.25
              ),
              decoration: ShapeDecoration(
                color: Color(0xFFFEBE01),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w * 0.085), // 32
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w * 0.052,  // 20.49
                    height: w * 0.052, // 20.40
                    child: SvgPicture.asset(
                      'assets/icons/play.svg',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: w * 0.01), // 3.62
                  Text(
                    'Play',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: w * 0.032, // 12.68
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.015), // 12

            // ⭐ FULL DESCRIPTION (UNCHANGED)
            Text(
              'Two hearts united as one, sharing a love that creates endless memories. '
                  'Today marks the beginning of a beautiful journey of togetherness, filled with joy, '
                  'laughter, and countless moments to cherish. Celebrating a bond that lasts forever — '
                  'built on love, trust, and happiness.',
              style: TextStyle(
                color: Colors.white,
                fontSize: w * 0.03, // 12
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: h * 0.025), // 20


            // -----------------------------------------
            // EVENT DATE
            // -----------------------------------------
            Row(
              children: [
                SizedBox(
                  width: w * 0.06,  // 24
                  height: w * 0.06, // 24
                  child: SvgPicture.asset('assets/icons/calendar_icon.svg'),
                ),
                SizedBox(width: w * 0.03), // 12

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Event Date',
                      style: TextStyle(
                        color: Color(0xFFB4A1A1),
                        fontSize: w * 0.03,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Oct 28,2025',
                      style: TextStyle(
                        color: Color(0xFFF1E7E7),
                        fontSize: w * 0.035,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: h * 0.02), // 16


            // -----------------------------------------
            // PLACE
            // -----------------------------------------
            Row(
              children: [
                SizedBox(
                  width: w * 0.06,
                  height: w * 0.06,
                  child: SvgPicture.asset('assets/icons/location_icon.svg'),
                ),
                SizedBox(width: w * 0.03),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Place',
                      style: TextStyle(
                        color: Color(0xFFB4A1A1),
                        fontSize: w * 0.03,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Hyderabad',
                      style: TextStyle(
                        color: Color(0xFFF1E7E7),
                        fontSize: w * 0.035,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
