import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> invitationData = [
    {
      "title": "Reception Invitation",
      "image1": "assets/images/invitation.png",
      "topIcon": false,
      "type": "image",
    },
    {
      "title": "Haldi Invitation",
      "image1": "assets/images/invitation.png",
      "topIcon": false,
      "type": "video",
    },
    {
      "title": "Wedding Invitation",
      "image1": "assets/images/invitation.png",
      "topIcon": false,
      "type": "",
    },
  ];
  final List<Map<String, dynamic>> engagementData = [
    {
      "title": "Ring Ceremony",
      "image1": "assets/images/prewedding.png",
      "topIcon": true,
      "type": "image",
    },
    {
      "title": "Exchange Ceremony",
      "image1": "assets/images/prewedding.png",
      "topIcon": true,
      "type": "video",
    },
    {
      "title": "Family Ceremony",
      "image1": "assets/images/prewedding.png",
      "topIcon": false,
      "type": "",
    },
  ];

  final List<Map<String, dynamic>> preweddingData = [
    {
      "title": "The Classic Shot",
      "image1": "assets/images/prewedding.png",
      "topIcon": true,
      "type": "image",
    },
    {
      "title": "The Modern City Shoot",
      "image1": "assets/images/prewedding.png",
      "topIcon": true,
      "type": "video",
    },
    {
      "title": "Family Ceremony",
      "image1": "assets/images/prewedding.png",
      "topIcon": false,
      "type": "",
    },
  ];

  final List<Map<String, dynamic>> legacyData = [
    {
      "title": "Geetha Wedding",
      "image1": "assets/images/legacy.png",
      "topIcon": true,
      "type": "image",
    },
    {
      "title": "Collage Event",
      "image1": "assets/images/legacy.png",
      "topIcon": true,
      "type": "video",
    },
    {
      "title": "Collage Event",
      "image1": "assets/images/legacy.png",
      "topIcon": false,
      "type": "",
    },
  ];

  final List<Map<String, String>> newMoviesList = [
    {'image': 'assets/images/movie.png'},
    {'image': 'assets/images/movie.png'},
    {'image': 'assets/images/movie.png'},
  ];
  final List<Map<String, String>> trendingMoviesList = [
    {'image': 'assets/images/movie.png'},
    {'image': 'assets/images/movie.png'},
    {'image': 'assets/images/movie.png'},
  ];

  final List<Map<String, String>> mostwatchedMoviesList = [
    {'image': 'assets/images/movie.png'},
    {'image': 'assets/images/movie.png'},
    {'image': 'assets/images/movie.png'},
  ];

  final List<Map<String, dynamic>> generalData = [
    {
      "title": "Geetha Wedding",
      "image1": "assets/images/general_voult.png",
      "topIcon": true,
      "type": "image",
    },
    {
      "title": "Collage Event",
      "image1": "assets/images/general_voult.png",
      "topIcon": true,
      "type": "video",
    },
    {
      "title": "Collage Event",
      "image1": "assets/images/general_voult.png",
      "topIcon": false,
      "type": "",
    },
  ];
  late final List<Map<String, dynamic>> sections = [
    {"title": "Invitation Cards", "data": invitationData},
    {"title": "Engagement", "data": engagementData},
    {"title": "PreWedding", "data": preweddingData},
    {"title": "Legacy Vault", "data": legacyData},
    {"title": "General Vault", "data": generalData},
  ];

  late final List<Map<String, dynamic>> ottsections = [
    {"title": "New Movies", "data": invitationData},
    {"title": "Trending Movies", "data": engagementData},
    {"title": "Most Watched Movies", "data": preweddingData},
  ];

  bool isEmpty = false;
  bool isott = false;

  @override
  Widget build(BuildContext context) {
    isEmpty = false;

    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;

    bool isWeb = AppResponsive.isDesktop(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(h, w, isWeb),
        body: (isott)
            ? OttSection(h, w)
            : (isEmpty)
            ? Center(child: emptyState(h))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    engagementPicture(h),
                    SizedBox(height: h * 0.018),

                    ...List.generate(sections.length, (index) {
                      final section = sections[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          header(section["title"], h, w, isWeb),
                          SizedBox(height: h * 0.015),
                          cardRow(section["data"], context, h, w, isWeb),
                          SizedBox(height: h * 0.02),
                        ],
                      );
                    }),

                    SizedBox(height: h * 0.05),
                  ],
                ),
              ),
      ),
    );
  }

  Widget OttSection(var h, var w) {
    return SingleChildScrollView(
      child: Column(
        children: [
          headerForOtt("New Movies", h, w),
          SizedBox(height: h * 0.013),
          OttRow(h, w, newMoviesList),
          SizedBox(height: h * 0.017),
          headerForOtt("Trending Movies", h, w),
          SizedBox(height: h * 0.013),
          OttRow(h, w, trendingMoviesList),
          SizedBox(height: h * 0.017),
          headerForOtt("Most Watched Movies", h, w),
          SizedBox(height: h * 0.013),
          OttRow(h, w, mostwatchedMoviesList),
          SizedBox(height: h * 0.017),
        ], 
      ),
    );
  }

  Widget OttRow(var h, var w, var newMoviesList) {
    bool isWeb = AppResponsive.isDesktop(context);

    return SizedBox(
      height: (isWeb) ? h * 0.4 : h * 0.30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: (isWeb) ? w * 0.015 : w * 0.04),
        itemCount: newMoviesList.length,
        separatorBuilder: (_, __) => SizedBox(width: w * 0.04),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: ()
            {
              context.push('/movie_details');
            },
            child: Container(
              height: (isWeb) ? h * 0.4 : h * 0.3,
              // width: w * 0.45,
              width: (isWeb) ? w * 0.15 : w * 0.45,
              child: Image.asset(newMoviesList[index]['image'], fit: BoxFit.fill),
            ),
          );
        },
      ),
    );
  }

  Widget headerForOtt(String s, var h, var w) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            s,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Text(
            'See all',
            style: TextStyle(
              color: const Color(0xFFFEBE01),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xFFFEBE01),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyState(var h) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: h * 0.2),
          Container(
            height: h * 0.2,
            child: Image.asset('assets/images/empty.png'),
          ),
          Text(
            'No Albums Found',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.10,
            ),
          ),
          SizedBox(height: h * 0.02),
          Text(
            'Your Studio Partner May \n Upload Soon...',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFEBE01),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.10,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardRow(
    List<Map<String, dynamic>> data,
    BuildContext context,
    var h,
    var w,
    bool isweb,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.map((card) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: cardItem(
                title: card["title"],
                image1: card["image1"],
                showTopIcon: card["topIcon"],
                type: card['type'],
                h: h,
                w: w,
                isweb: isweb,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget cardItem({
    required String title,
    required String image1,
    required bool showTopIcon,
    required String type,
    required double h,
    required double w,
    required bool isweb,
  }) {
    bool isWeb = AppResponsive.isDesktop(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            /// FIRST IMAGE
            Container(
              width: (isWeb) ? w * 0.15 : w * 0.39, // 137 → responsive
              height: (isWeb) ? h * 0.35 : h * 0.25, // 200 → responsive
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(image1).image,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            /// TOP RIGHT ICON
            if (showTopIcon)
              Positioned(
                right: w * 0.015, // 6 → responsive
                top: h * 0.007, // 6 → responsive
                child: Container(
                  width: (isWeb) ? w * 0.03 : w * 0.065, // 24 → responsive
                  height: (isWeb) ? w * 0.03 : w * 0.065, // keep circle
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: (isWeb) ? w * 0.02 : w * 0.038, // 14 → responsive
                      height: (isWeb) ? w * 0.02 : w * 0.038, // keep square
                      child: (type == 'image')
                          ? SvgPicture.asset('assets/icons/photo.svg')
                          : SvgPicture.asset('assets/icons/video.svg'),
                    ),
                  ),
                ),
              ),

            /// BOTTOM GRADIENT
            Positioned(
              bottom: 0,
              child: Container(
                width: w * 0.33, // 137 → responsive
                height: h * 0.06, // 50 → responsive
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ),
                ),
              ),
            ),

            /// TITLE ON IMAGE (BOTTOM CENTER)
            Positioned(
              bottom: h * 0.02, // 22 → responsive
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:  14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: h * 0.006), // 4 → responsive
      ],
    );
  }

  Widget engagementPicture(var h) {
    bool isWeb = AppResponsive.isDesktop(context);

    Widget img = Container(
      width: double.infinity,
      height: (isWeb) ? h * 0.93 : h * 0.23,
      child: Image.asset('assets/images/engagement.png', fit: BoxFit.fill),
    );

    return InkWell(
      onTap: () {
        context.push('/video_details');
      },
      child: isWeb ? Expanded(child: img) : img,
    );
  }

  Widget header(String s, var h, var w, bool isweb) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            s,
            style: TextStyle(
              color: Colors.white,
              fontSize: (isweb) ? 20 : 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Text(
            'See All',
            style: TextStyle(
              color: const Color(0xFF795858),
              fontSize: (isweb) ? 19 : 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
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
                  'Studio App',
                  style: TextStyle(
                    color: const Color(0xFFFEBE01),
                    fontSize: (isWeb) ? w * 0.02 : w * 0.07,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                (!isott)
                    ? Text(
                        'Dphotowala Studio',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: (isWeb) ? w * 0.01 : w * 0.034,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),

            const Spacer(),

            /// OTT CHIP
            InkWell(
              onTap: () {
                setState(() {
                  isott = !isott;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: (isWeb) ? w * 0.02 : w * 0.03,
                  vertical: (isWeb) ? h * 0.005 : h * 0.009,
                ),
                decoration: ShapeDecoration(
                  color: isott ? Colors.red : const Color(0xFFFEBE01),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'OTT',
                      style: TextStyle(
                        color: const Color(0xFF222222),
                        fontSize: (isWeb) ? w * 0.01 : w * 0.03,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: w * 0.01),
                    SizedBox(
                      width: (isWeb) ? w * 0.02 : w * 0.035,
                      height: (isWeb) ? w * 0.02 : w * 0.035,
                      child: isott
                          ? SvgPicture.asset('assets/icons/out.svg')
                          : SvgPicture.asset('assets/icons/play.svg'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: w * 0.03),

            /// NOTIFICATION CIRCLE
            Container(
              width: (isWeb) ? w * 0.06 : w * 0.09,
              height: (isWeb) ? h * 0.06 : w * 0.09,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF372901)),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: (isWeb) ? w * 0.04 : w * 0.06,
                  height: (isWeb) ? w * 0.04 : w * 0.06,
                  child: SvgPicture.asset('assets/icons/notification.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
