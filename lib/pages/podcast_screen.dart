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
  final h=SizeConfig.screenHeight;
  final w=SizeConfig.screenWidth;

  @override
  Widget build(BuildContext context) {
    final isweb=AppResponsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
        padding: EdgeInsets.symmetric(horizontal: h * 0.012),
        child: Column(
          children: [
            SizedBox(height: h * 0.008),

            /// STATUS ROW (same for all)
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

            /// --------- EPISODE LIST / GRID BASED ON WEB OR MOBILE ---------
            Expanded(
              child: isweb
                  ? GridView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,          // 3 per row
                  crossAxisSpacing: w * 0.015,
                  mainAxisSpacing: h * 0.02,
                  childAspectRatio: 1,     // Adjust for card height
                ),
                itemCount: 9, // or your dynamic list length
                itemBuilder: (context, index) {
                  return EpisodeCard(
                    width: w * 0.30,   // adapt card width
                    height: h, isweb: isweb,
                  );
                },
              )
                  : ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: EpisodeCard(
                      width: w,
                      height: h,
                      isweb : isweb
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


}
class EpisodeCard extends StatelessWidget {
  final double width;
  final double height;
  final bool isweb;

  const EpisodeCard({
    super.key,
    required this.width,
    required this.height,
    required this.isweb,
  });

  @override
  Widget build(BuildContext context) {
    double cardPadding = width * 0.02;
    double imageHeight = isweb ? height * 0.3 : height * 0.22;
    double progressHeight = height * 0.01;
    double progressWidth = width * 0.65;

    return InkWell(
      onTap: () {
        context.push('/podcast_details');
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
            /// ---------- IMAGE ----------
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

            /// ---------- TITLE ----------
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

            /// ---------- DESCRIPTION ----------
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

            /// ---------- ROW: ICON + PROGRESS + DURATION ----------
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 28,
                  height: 28,
                  child: SvgPicture.asset('assets/icons/playcircle.svg'),
                ),

                SizedBox(width: width * 0.02),

                /// Progress bar
                Container(
                  width: progressWidth,
                  height: progressHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4D3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                const Spacer(),

                /// Duration
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

