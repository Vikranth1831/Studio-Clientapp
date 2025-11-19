import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';



class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {


  final List<Map<String, String>> items = [
    {"title": "Image 1", "img": "assets/images/couple.png"},
    {"title": "Image 2", "img": "assets/images/couple.png"},
    {"title": "Image 3", "img": "assets/images/couple.png"},
    {"title": "Image 4", "img": "assets/images/couple.png"},
    {"title": "Image 5", "img": "assets/images/couple.png"},
  ];

  final coupleImages = [
    "assets/images/couple_1.png",
    "assets/images/couple_2.png",
    "assets/images/couple_3.png",
    "assets/images/couple_4.png",
  ];

  late List<bool> selectedItems;



  @override
  void initState() {
    super.initState();
    selectedItems = List.generate(items.length, (_) => true);
    final List<String> imageList = items.map((e) => e['img']!).toList();

  }

  @override
  Widget build(BuildContext context) {
    final repeatedImages =
    List.generate(3, (_) => coupleImages).expand((e) => e).toList();
    final h = SizeConfig.screenHeight;
    final w =  SizeConfig.screenWidth;
    bool isweb=AppResponsive.isDesktop(context);
    return Scaffold(

      backgroundColor: Colors.black,

      body: (isweb) ? webcontent(h,w,repeatedImages) :
      Column(
        children: [
          SizedBox(height: h * 0.05,),
          topRow(h, w),
          SizedBox(height: 13,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return imageItem(
                  imagePath: items[index]["img"]!,
                  index: index,
                  h: h,
                  w: w,
                );
              },
            ),
          )
        ],
      ),

    );
  }
  Widget webcontent(var h,var w,var repeatedImages)
  {
    return   Expanded(
      child: SingleChildScrollView(
        child: MasonryGridView.count(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: h * 0.015,
          crossAxisSpacing: w * 0.03,
          itemCount: repeatedImages.length,
          itemBuilder: (context, index) {
            final image = repeatedImages[index];
            return InkWell(
              onTap: ()
              {
                final List<String> imageList =
                items.map((e) => e['img']!).toList();

                context.push('/image_viewer', extra: {
                  'images': imageList,
                  'index': index,
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  Widget topRow(double h, double w) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Row(
        children: [

          /// LEFT TEXT
          Text(
            'Favorites Images',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),

          const Spacer(),

          /// RIGHT "Select" CHIP
          InkWell(
            onTap: ()
            {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => Center(child: popupCard(h, w)),
              );

            },
            child: Container(
              height: h * 0.045,
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.04,
                vertical: h * 0.005,
              ),
              decoration: ShapeDecoration(
                color: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w * 0.08),
                ),
              ),
              child: const Center(
                child: Text(
                  'Select',
                  style: TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget imageItem({
    required String imagePath,
    required int index,
    required double h,
    required double w,
  }) {
    return InkWell(
      onTap: ()
      {
        final List<String> imageList =
        items.map((e) => e['img']!).toList();

        context.push('/image_viewer', extra: {
          'images': imageList,
          'index': index,
        });
      },
      child: Container(
        width: w,
        height: h * 0.30,     // ~30% height (make it any % you like)
        margin: EdgeInsets.only(bottom: h * 0.02),
        child: Stack(
          children: [
            /// IMAGE BACKGROUND
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * 0.02),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            /// SELECTOR CIRCLE (TOP-LEFT)
            Positioned(
              left: w * 0.03,
              top: h * 0.04,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItems[index] = !selectedItems[index];
                  });
                },

                child: Container(
                  width: w * 0.09,
                  height: w * 0.09,
                  alignment: Alignment.center,   // keeps both centered
                  child: (!selectedItems[index])
                      ? Container(
                    width: w * 0.09,
                    height: w * 0.09,
                    decoration: ShapeDecoration(
                      color: Colors.white.withValues(alpha: 0.90),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 0.1),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: w * 0.05,
                        height: w * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w * 0.01),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                  )

                  /// SELECTED → SVG INSIDE SAME FIXED SIZE BOX
                      : Transform.scale(
                    scale: 2.4,
                    child: SvgPicture.asset(
                      'assets/icons/selected.svg',
                      width: w * 0.06,
                      height: w * 0.06,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget popupCard(double h, double w) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: w * 0.85,
          padding: EdgeInsets.all(w * 0.05),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(w * 0.05),
            ),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// SVG ICON
              SvgPicture.asset(
                "assets/icons/selection.svg",  // replace with real path
                width: w * 0.16,
                height: w * 0.16,
                fit: BoxFit.contain,
              ),

              SizedBox(height: h * 0.02),

              /// TEXT
              Text(
                'Select your favorite image to create album',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.22,
                ),
              ),

              SizedBox(height: h * 0.03),

              /// BUTTON
              InkWell(
                onTap: ()
                {
                  context.push('/list_grid');
                },
                child: Container(
                  width: double.infinity,
                  height: h * 0.055,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFEBE01),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * 0.07),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Let's Select",
                      style: const TextStyle(
                        color: Color(0xFF725500),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget createAlbumBottomBar(double h, double w) {
    return SafeArea(
      top: false, // bottom only
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: h * 0.015,
          left: w * 0.04,
          right: w * 0.04,
          bottom: h * 0.04,
        ),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// BUTTON
            Container(
              width: double.infinity,
              height: h * 0.06,
              decoration: ShapeDecoration(
                color: const Color(0xFFFEBE01),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w * 0.06),
                ),
              ),
              child: const Center(
                child: Text(
                  'Create Album',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            SizedBox(height: h * 0.015),
          ],
        ),
      ),
    );
  }



}

