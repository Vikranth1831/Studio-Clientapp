import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';



class Listandgridfavourites extends StatefulWidget {
  const Listandgridfavourites({super.key});

  @override
  State<Listandgridfavourites> createState() => _ListandgridfavouritesState();
}

class _ListandgridfavouritesState extends State<Listandgridfavourites> {

  bool isList = false; // toggle state

  final List<Map<String, String>> items = [
    {"title": "Image 1", "img": "assets/images/couple.png"},
    {"title": "Image 2", "img": "assets/images/couple.png"},
    {"title": "Image 3", "img": "assets/images/couple.png"},
    {"title": "Image 4", "img": "assets/images/couple.png"},
    {"title": "Image 5", "img": "assets/images/couple.png"},
  ];

  /// Selection list
  late List<bool> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = List.generate(items.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      backgroundColor: Colors.black,

      body: Column(
        children: [

          selectorRow(h, w),
          SizedBox(height: 12,),

          (isList) ?
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(w * 0.04),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: h * 0.015),
                  child: favouriteItem(
                    title: items[index]["title"]!,
                    imagePath: items[index]["img"]!,
                    index: index,
                    h: h,
                    w: w,
                  ),
                );
              },
            ),


          ) :
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
      bottomNavigationBar: createAlbumBottomBar(h, w),
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
            InkWell(
              onTap: ()
              {
             context.push('/upload');
              },
              child: Container(
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
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: h * 0.01),
          ],
        ),
      ),
    );
  }


  // ⭐ FAVOURITE ITEM
  Widget favouriteItem({
    required String title,
    required String imagePath,
    required int index,
    required double h,
    required double w,
  }) {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.03,
        vertical: h * 0.01,
      ),
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: 0.20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(w * 0.02),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// LEFT SIDE  (image + title)
          Row(
            children: [
              Container(
                width: w * 0.09,
                height: w * 0.09,
                decoration: BoxDecoration(
                  border: Border.all(width: w * 0.004),
                  borderRadius: BorderRadius.circular(w * 0.015),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: w * 0.02),

              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFD1D1D1),
                  fontSize: 14,  // (unchanged as per your rule)
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.10,
                ),
              ),
            ],
          ),

          /// RIGHT SIDE (select box)
          GestureDetector(
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
                  : Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Transform.scale(
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
    return Container(
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
    );
  }


  // ⭐ SELECTOR ROW
  Widget selectorRow(double h, double w) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            isList ? 'List' : 'Grid',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20, // (unchanged)
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.10,
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.02,
              vertical: h * 0.005,
            ),
            decoration: ShapeDecoration(
              color: const Color(0xFFFEBE01),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(w * 0.09),
              ),
            ),
            child: Row(
              children: [

                // LIST ICON
                GestureDetector(
                  onTap: () => setState(() => isList = true),
                  child: Container(
                    width: w * 0.08,
                    height: w * 0.08,
                    decoration: ShapeDecoration(
                      color: isList ? Colors.white : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 0.08),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/list.svg",
                        width: w * 0.05,
                        color: isList ? const Color(0xFFFEBE01) : Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: w * 0.02),

                // GRID ICON
                GestureDetector(
                  onTap: () => setState(() => isList = false),
                  child: Container(
                    width: w * 0.08,
                    height: w * 0.08,
                    decoration: ShapeDecoration(
                      color: isList ? Colors.transparent : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 0.08),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/grid.svg",
                        width: w * 0.05,
                        color: isList ? Colors.white : const Color(0xFFFEBE01),
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
