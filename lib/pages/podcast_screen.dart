import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_responsive.dart';
class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  int selectedTab = 0;
  bool showDetails = false; // 👈 NEW FOR WEB DETAILS PANEL

  final h = SizeConfig.screenHeight;
  final w = SizeConfig.screenWidth;

  @override
  Widget build(BuildContext context) {
    final isweb = AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: const Text(
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
        padding: EdgeInsets.symmetric(horizontal: h * 0.012),

        child: isweb
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ---------------- LEFT SIDE GRID ----------------
            Expanded(
              flex: showDetails ? 2 : 3,
              child: Column(
                children: [
                  SizedBox(height: h * 0.008),

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

                  SizedBox(height: h * 0.015),

                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: showDetails ? 2 : 3,
                        crossAxisSpacing: w * 0.015,
                        mainAxisSpacing: h * 0.02,
                        childAspectRatio: 1,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return EpisodeCard(
                          width: w * 0.30,
                          height: h,
                          isweb: isweb,
                          onWebTap: () {
                            setState(() {
                              showDetails = true;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            /// ---------------- RIGHT DETAILS PANEL ----------------
            if (showDetails) ...[
              SizedBox(width: w * 0.03),

              SizedBox(
                width: w * 0.30,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.063),
                      EpisodeDetailHeaderWeb(width: w, height: h),
                      SizedBox(height: h * 0.08),
                      //NextPodcastCard(width: w, height: h),
                    ],
                  ),
                ),
              ),
            ],
          ],
        )

        /// ---------------- MOBILE LAYOUT ----------------
            : Column(
          children: [
            SizedBox(height: h * 0.008),

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

            SizedBox(height: h * 0.015),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: EpisodeCard(
                      width: w,
                      height: h,
                      isweb: isweb,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget EpisodeDetailHeaderWeb({
    required double width,
    required double height,
  }) {
    // Web-optimized responsive sizes
    double titleSpacing = height * 0.008;
    double sliderWidth = width * 0.80;     // Wider for web
    double sliderThickness = height * 0.004;
    double timeSpacing = height * 0.015;

    double mainControlSize = width * 0.04;
    double smallControlSize = width * 0.03;
    double horizontalGap = width * 0.03;
    double cardPadding = width * 0.008;


    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.20),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: w,
              child: Image.asset('assets/images/podcast.png')
          ),
          SizedBox(height: h * 0.05,),

          /// ------------------ TITLE + HEART ICON ------------------
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
                      fontSize: 17,        // Bigger on web
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
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              /// Heart button
              SizedBox(
                width: width * 0.02,
                height: width * 0.02,
                child: SvgPicture.asset(
                  'assets/icons/heart.svg',
                ),
              ),
            ],
          ),

         SizedBox(height: height * 0.02),

          /// ------------------ PROGRESS BAR ------------------
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
                    widthFactor: 0.45,   // 45% played
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
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "25:00",
                    style: TextStyle(
                      color: Color(0xFFA9B0B6),
                      fontSize: 13,
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
              /// Backward 10 seconds
              SizedBox(
                width: smallControlSize,
                height: smallControlSize,
                child: const Icon(
                  Icons.fast_rewind,
                  size: 20,
                  color: Colors.white,
                ),
              ),

              SizedBox(width: horizontalGap),

              /// Play Button (large)
              Container(
                width: mainControlSize,
                height: mainControlSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  size: 25,
                  color: Colors.black,
                ),
              ),

              SizedBox(width: horizontalGap),

              /// Forward
              SizedBox(
                width: smallControlSize,
                height: smallControlSize,
                child: const Icon(
                  Icons.fast_forward,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class EpisodeCard extends StatelessWidget {
  final double width;
  final double height;
  final bool isweb;
  final VoidCallback? onWebTap; // 👈 Added for web-only click

  const EpisodeCard({
    super.key,
    required this.width,
    required this.height,
    required this.isweb,
    this.onWebTap,
  });

  @override
  Widget build(BuildContext context) {
    double cardPadding = width * 0.02;
    double imageHeight = isweb ? height * 0.3 : height * 0.22;
    double progressHeight = height * 0.01;
    double progressWidth = width * 0.65;

    return InkWell(
      onTap: () {
        if (isweb && onWebTap != null) {
          onWebTap!();
        } else {
          context.push('/podcast_details');
        }
      },

      child: Container(
        width: width,
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.20),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Container(
              height: imageHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/images/podcast.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: height * 0.015),

            const Text(
              "First marriage trip",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: height * 0.01),

            const Text(
              "Join us as we revisit our first trip after marriage — a journey filled with laughter, love, and unforgettable moments. From spontaneous adventures to quiet moments together, this episode captures the beauty of new beginnings and the joy of discovering life as a couple.",
              style: TextStyle(
                color: Color(0xFFA9A9A9),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              maxLines: 5,
            ),

            SizedBox(height: height * 0.02),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 28,
                  height: 28,
                  child: SvgPicture.asset('assets/icons/playcircle.svg'),
                ),

                SizedBox(width: width * 0.02),

                Container(
                  width: progressWidth,
                  height: progressHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4D3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                const Spacer(),

                const Text(
                  "25 Min",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class StatusRows extends StatelessWidget {
  final double width;
  final double height;
  final List<String> statuses;
  final int selectedIndex;
  final bool isweb;
  final Function(int) onSelected;

  const StatusRows({
    super.key,
    required this.width,
    required this.height,
    required this.statuses,
    required this.selectedIndex,
    required this.isweb,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    double chipHeight = isweb ? height * 0.055 : height * 0.038;
    double spacing = isweb ? width * 0.025 : width * 0.04;

    return SizedBox(
      width: width,
      child: Row(
        children: List.generate(statuses.length, (index) {
          bool isSelected = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.only(right: spacing),
            child: GestureDetector(
              onTap: () => onSelected(index),
              child: Container(
                height: chipHeight,
                padding: EdgeInsets.symmetric(
                  horizontal: isweb ? width * 0.03 : width * 0.035,
                ),
                decoration: ShapeDecoration(
                  color: isSelected
                      ? const Color(0xFFFEBE01)
                      : Colors.white.withOpacity(0.20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    statuses[index],
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xFF222222)
                          : const Color(0xFFD0D0D0),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.19,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

