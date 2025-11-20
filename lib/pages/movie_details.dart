import 'package:clientapp_studio/utils/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../utils/media_query_helper.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final h=SizeConfig.screenHeight;
    final w=SizeConfig.screenWidth;
    bool isweb=AppResponsive.isDesktop(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                   Container(
                     height: h * 0.6 ,
                       width: double.infinity,
                       child: Image.asset('assets/images/dia.png')
                   ),
              SizedBox(height: h * 0.023,),
              Row(
                children: [
                  Text(
                    'Dia',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width:w * 0.1,
                    height: 48,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFEBE01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Text(
                          'Play Now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: SvgPicture.asset('assets/icons/play.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.025,),

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 7.25,
                children: [
                  Text(
                    '2022',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(1.81),
                    decoration: ShapeDecoration(
                      color: Colors.white.withValues(alpha: 0.20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.81),
                      ),
                    ),
                    child: Text(
                      'U/A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7.25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    'Movie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(1.81),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.91,
                          color: Colors.white.withValues(alpha: 0.20),
                        ),
                        borderRadius: BorderRadius.circular(1.81),
                      ),
                    ),
                    child: Text(
                      'HD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7.25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.025,),
              Text(
                'Two hearts united as one, sharing a love that creates endless memories. Today marks the beginning of a beautiful journey of togetherness, filled with joy, laughter, and countless moments to cherish. Celebrating a bond that lasts forever — built on love, trust, and happiness.',
                style: TextStyle(
                  color: const Color(0xFFF5F5F5),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: h * 0.025,),

              if(!isweb)
              Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEBE01),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      'Play Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: SvgPicture.asset('assets/icons/play.svg'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.1,),

            ],
          ),
        ),
      ),
    );
  }
}
