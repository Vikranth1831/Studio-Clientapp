import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils/media_query_helper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class UploadPictures extends StatefulWidget {
  const UploadPictures({super.key});

  @override
  State<UploadPictures> createState() => _UploadPicturesState();
}

class _UploadPicturesState extends State<UploadPictures> {
  final coupleImages = [
    "assets/images/couple_1.png",
    "assets/images/couple_2.png",
    "assets/images/couple_3.png",
    "assets/images/couple_4.png",
  ];
  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;



    final repeatedImages =
    List.generate(3, (_) => coupleImages).expand((e) => e).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: h * 0.030),
          onPressed: () {
            context.pop();
          },
        ),

      ),

      /// ✅ Body
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: Column(
          children: [
            SizedBox(height: h * 0.02),

            /// ✅ Staggered Grid
            Expanded(
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
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      /// ✅ Bottom Navigation
        bottomNavigationBar: SafeArea(
          minimum: EdgeInsets.only(bottom: h * 0.01),
          child: Container(
            width: double.infinity,
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.04),

            child: InkWell(
              onTap: ()
              {
                context.push('/select_studio');
              },
              child: Container(
                height: h * 0.06,      // ✅ This works now
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEBE01),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Confirm",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )

    );
  }
}



