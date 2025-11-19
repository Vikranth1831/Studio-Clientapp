import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String description;
  final double price;
  final bool isFree;

  const BookDetailsPage({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width  = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),

        centerTitle: true,
        title: const Text(
          "Book Info",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// IMAGE
            Container(
              height: height * 0.250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: height * 0.03),

            /// ROW → TITLE + AUTHOR LEFT | PRICE RIGHT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// TITLE + AUTHOR
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xffF5F5F5),
                          fontSize: 22,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: height * 0.005),

                      Text(
                        "by $author",
                        style: TextStyle(
                          color: Color(0xff858585),
                          fontFamily: "Inter",
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                /// PRICE ON RIGHT
                Text(
                  isFree ? "Free" : "₹$price",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 28,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    decoration: isFree ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.03),

            /// DESCRIPTION (no heading)
            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontFamily: "Inter",
                height: 1.45,
              ),
            ),
          ],
        ),
      ),

      /// BOTTOM BUY BUTTON
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.045),

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFEBE01),
              minimumSize: Size(double.infinity, height * 0.05),

              /// More border radius
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),

            onPressed: () {
              context.push('/payments',extra: {"fromBook":true});
            },

            child: Text(
              isFree ? "Get for Free" : "Buy Now",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
