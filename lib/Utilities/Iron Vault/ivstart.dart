import 'package:flutter/material.dart';
import '../../utils/media_query_helper.dart';

class IronVault1 extends StatefulWidget {
  const IronVault1({super.key});

  @override
  State<IronVault1> createState() => _IronVault1State();
}

class _IronVault1State extends State<IronVault1> {
  @override
  Widget build(BuildContext context) {
    final double h = SizeConfig.screenHeight;
    final double w = SizeConfig.screenWidth;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// IMAGE
              Container(
                child: Image.asset('assets/images/imagesh.png'),
                height: h * 0.3,
                width: w * 1,
              ),

              SizedBox(height: h * 0.03),

              /// BOLD TEXT
              Text(
                "Secure Document Vault",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: h * 0.01),

              /// NORMAL TEXT
              Text(
                "Your Sensitive Documents Are Protected with \n Multi layer Security verification",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white70,
                  fontSize: w * 0.04,
                ),
              ),

              SizedBox(height: h * 0.04),

              /// GRADIENT BUTTON WITH ICON + TEXT
              Container(
                width: w * 0.6,
                height: h * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFEBE01),
                      Color(0xFFD69E9E),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    // Add your onTap action here
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Image.asset('assets/icons/Lock.png',color: Colors.black,),


                      SizedBox(width: w * 0.02),
                      Text(
                        "Access Iron Vault",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
