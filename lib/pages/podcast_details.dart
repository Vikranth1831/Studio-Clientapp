import 'package:clientapp_studio/pages/podcast_screen.dart';
import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class PodcastDetails extends StatefulWidget {
  const PodcastDetails({super.key});

  @override
  State<PodcastDetails> createState() => _PodcastDetailsState();
}

class _PodcastDetailsState extends State<PodcastDetails> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final h=SizeConfig.screenHeight;
    final w=SizeConfig.screenWidth;
    final isweb=AppResponsive.isDesktop(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: (!isweb) ?
      AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,

        // Back icon
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        // Title
        title: const Text(
          "Podcast",
          style: TextStyle(
            fontSize: 20,          // you can edit font
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ) : AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Podcast",
          style: TextStyle(
            fontSize: 26,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        child: Column(
          children: [
            SizedBox(height: h *  0.03,),
            if(isweb)
            StatusRows(
              width: w,
              height: h,
              statuses: ["All", "New", "Favorites"],
              selectedIndex: selectedTab,
              isweb: isweb,
              onSelected: (index) {
                setState(() {
                  selectedTab = index;
                });
              },
            ),
            Container(
              width: w,
                child: Image.asset('assets/images/podcast.png')
            ),
            SizedBox(height: h *  0.03,),
            EpisodeDetailHeader(
              width: w,
              height: h,
            ),
            SizedBox(height: h *  0.08,),
            NextPodcastCard(
              width: w,
              height: h,
            ),
          ],
        ),
      ),

    );
  }

  Widget EpisodeDetailHeader({
    required double width,
    required double height,
  })
  {
    // Responsive sizes
    double titleSpacing = height * 0.006;
    double sliderWidth = width * 0.92;
    double sliderThickness = height * 0.005;
    double timeSpacing = height * 0.012;
    double controlButtonSize = width * 0.12;
    double smallButtonSize = width * 0.10;
    double horizontalGap = width * 0.05;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// ------------------ TITLE + SUBTITLE + RIGHT ICON ------------------
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "First marriage trip",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                SizedBox(height: titleSpacing),

                const Text(
                  "Huberman Lab",
                  style: TextStyle(
                    color: Color(0xFFB8C1C7),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const Spacer(),

            SizedBox(
              width: width * 0.065,
              height: width * 0.065,
              child: SvgPicture.asset('assets/icons/heart.svg'),
            ),
          ],
        ),

        SizedBox(height: height * 0.03),

        /// ------------------ PROGRESS BAR + TIME ------------------
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sliderWidth,
              height: sliderThickness,
              decoration: BoxDecoration(
                color: const Color(0xFF727271),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: 0.3, // hardcoded
                  child: Container(
                    height: sliderThickness,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: timeSpacing),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "0:00",
                  style: TextStyle(
                    color: Color(0xFFA9B0B6),
                    fontSize: 11,
                  ),
                ),
                Text(
                  "25:00",
                  style: TextStyle(
                    color: Color(0xFFA9B0B6),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: height * 0.03),

        /// ------------------ PLAYER CONTROLS ------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Backward
            SizedBox(
              width: smallButtonSize,
              height: smallButtonSize,
              child: const Icon(Icons.fast_rewind,
                  size: 32, color: Colors.white),
            ),

            SizedBox(width: horizontalGap),

            /// Play Button
            Container(
              width: controlButtonSize,
              height: controlButtonSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 32,
              ),
            ),

            SizedBox(width: horizontalGap),

            /// Forward
            SizedBox(
              width: smallButtonSize,
              height: smallButtonSize,
              child: const Icon(Icons.fast_forward,
                  size: 32, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget NextPodcastCard({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.only(bottom: height * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---- Next Podcast Title ----
          Text(
            "Next Podcast",
            style: const TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 12,       // font NOT responsive as requested
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),

          SizedBox(height: height * 0.015),

          /// ---- Card Background ----
          Container(
            width: width,
            padding: EdgeInsets.all(width * 0.03),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(8),
            ),

            /// ---- Card Content ----
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  "First international trip podcast",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,  // fixed font
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: height * 0.008),

                /// Description
                Text(
                  "Experience the thrill of our first international adventure — new places, new cultures, and count.",
                  style: const TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12, // fixed font
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: height * 0.012),

                /// Duration
                const Text(
                  "05:16",
                  style: TextStyle(
                    color: Color(0xFFA9B0B6),
                    fontSize: 12,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w500,
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
