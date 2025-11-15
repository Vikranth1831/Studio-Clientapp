import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Plans extends StatefulWidget {
  const Plans({super.key});

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> plans = [
    {
      'storage': '20Gb',
      'price': '₹1,000',
      'desc': 'Single Device with AES encrypted end-to-end',
      'tag': 'Basic',
      'tagColor': Colors.cyanAccent,
    },
    {
      'storage': '40Gb',
      'price': '₹2,000',
      'desc': 'Dual Device with AES encrypted end-to-end',
      'tag': 'Standard',
      'tagColor':  Color(0xffFEBE01),
    },
    {
      'storage': '60Gb',
      'price': '₹3,000',
      'desc': 'Dual Device with AES encrypted end-to-end',
      'tag': 'Advance',
      'tagColor': Colors.lightGreenAccent,
    },
    {
      'storage': '100Gb',
      'price': '₹4,500',
      'desc': 'Dual Device with AES encrypted end-to-end',
      'tag': 'Premium',
      'tagColor': Colors.greenAccent,
    },
    {
      'storage': '100Gb',
      'price': '₹3,000',
      'desc': 'Dual Device with AES encrypted end-to-end',
      'tag': 'Elite',
      'tagColor': Colors.cyan,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),
              Text(
                'Hello!!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.0),
              Text(
                'Select your plan',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: width * 0.05,
                ),
              ),
              SizedBox(height: height * 0.05),
              Text(
                'Select Subscription Plan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.02),

              /// Plans list
              Expanded(
                child: ListView.builder(
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    final plan = plans[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.01),
                        padding: EdgeInsets.all(width * 0.04),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(0xffFEBE01)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center, // ✅ centers vertically
                          children: [
                            /// Left text content
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.045,
                                    ),
                                    children: [
                                      TextSpan(text: 'Storage ${plan['storage']} for '),
                                      TextSpan(
                                        text: plan['price'], // ✅ make only price bold
                                        style: TextStyle(fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * 0.005),
                                Text(
                                  plan['desc'],
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: width * 0.03,
                                  ),
                                ),
                              ],
                            ),

                            /// Right tag container
                            Container(
                              alignment: Alignment.center, // ✅ centers text inside
                              height: height * 0.025, // ✅ uniform height
                              width: width * 0.17,   // ✅ uniform width
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white : plan['tagColor'],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                plan['tag'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                      ),
                    );
                  },
                ),
              ),

              /// Continue button

              Padding(
                padding: EdgeInsets.only(bottom: height * 0.035),
                child: SizedBox(
                  width: double.infinity,
                  height: height * 0.065,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xffFEBE01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: selectedIndex != -1
                        ? () {
                        context.go('/payments');
                              }
                        : null,
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.045,
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
}
