import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';

class LegacyWalletHome extends StatefulWidget {
  const LegacyWalletHome({super.key});

  @override
  State<LegacyWalletHome> createState() => _LegacyWalletHomeState();
}

class _LegacyWalletHomeState extends State<LegacyWalletHome> {
  final List<Map<String, String>> Images = [
    {"image" : 'assets/images/rowimage.png',},
    {"image" : 'assets/images/rowimage.png',},
    {"image" : 'assets/images/rowimage.png',},
  ];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back,size: 16,color: Colors.white,),
        centerTitle: true,
        title: Text("Legacy Vault",style: TextStyle(color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 16,
        ),),
      ),
      body: Column(
        children: [

          Center(
            child: Container(
              height: h * 0.175,
              width: w * 0.9,

              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                   Image.asset('assets/images/rowimage.png',
                     height: h * 0.15,
                     width: w * 0.4,
                   ),
                    Image.asset('assets/images/rowimage.png',
                      height: h * 0.15,
                      width: w * 0.4,),




                  ],


                      ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
