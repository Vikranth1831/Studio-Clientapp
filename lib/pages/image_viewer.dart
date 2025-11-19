import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
class ImageViewer extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const ImageViewer({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w =  SizeConfig.screenWidth;
    bool isWeb=AppResponsive.isDesktop(context);

    final controller = PageController(initialPage: initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          SizedBox(height: h * 0.05,),
          TitleRow(h,w,context,isWeb),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return InteractiveViewer(
                  maxScale: 4,
                  minScale: 1.0,

                  child: SizedBox.expand(
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.contain,     // Fills FULL screen
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget TitleRow(double h, double w, BuildContext context,bool isweb) {
    return Material(
      color: Colors.transparent, // keeps background same
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
               context.pop();
              },
            ),

            const Spacer(),

            if(!isweb)
            Container(
              width: w * 0.09,
              height: w * 0.09,
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 2.4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/icons/selected.svg',
                    width: w * 0.06,
                    height: w * 0.06,
                    fit: BoxFit.contain,
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
