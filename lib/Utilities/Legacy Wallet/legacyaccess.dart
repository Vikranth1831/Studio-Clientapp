import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../utils/media_query_helper.dart';

class LegacyVaultAccess extends StatefulWidget {
  const LegacyVaultAccess({super.key});

  @override
  State<LegacyVaultAccess> createState() => _LegacyVaultAccessState();
}

class _LegacyVaultAccessState extends State<LegacyVaultAccess> {
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
                child: Image.asset('assets/images/vaultShield.png'),
                height: h * 0.25,
                width: w * 1,

              ),

              SizedBox(height: h * 0.03),

              /// BOLD TEXT
              Text(
                "Secure Legacy Vault",
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
                  color: Color(0xffB49F9F),
                  fontSize: w * 0.04,
                ),
              ),

              SizedBox(height: h * 0.04),

              /// GRADIENT BUTTON WITH ICON + TEXT
              Container(
                width: w * 0.55,
                height: h * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                    context.push('/vaultotp');
                    // Add your onTap action here
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/outlinelock.png',color: Colors.black,
                      height: h* 0.04,),


                      SizedBox(width: w * 0.01),
                      Text(
                        "Legacy wallet",
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
