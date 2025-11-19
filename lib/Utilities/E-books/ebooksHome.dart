import 'package:clientapp_studio/Components/CutomAppBar.dart';
import 'package:clientapp_studio/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Ebookshome extends StatefulWidget {
  const Ebookshome({super.key});

  @override
  State<Ebookshome> createState() => _EbookshomeState();
}

class _EbookshomeState extends State<Ebookshome> {

  final List<Map<String, String>> books = [
    {
      "title": "Fairytale  Book",
      "author": "Kristina Buszton",
      "image": "assets/images/Mask group.png",
      "price": "549",
      "description": "With fair-tressed Demeter, the sacred goddess, my song begins, With herself and her slim-ankled daughter, whom Aidoneus once Abducted...' Most people are familiar, at least by repute, with the two great epics of Homer, the Iliad and the Odyssey, but few are aware that other poems survive that were attributed to Homer in ancient times. The Homeric Hymns are now known to be the work of various poets working in the same tradition, probably during the seventh and sixth centuries BC."
    },
    {
      "title": "Kids Moral Stories",
      "author": "David Warner",
      "image": "assets/images/Mask group.png",
      "price": "594",
      "description": "Short and meaningful moral stories for kids."
    },
    {
      "title": "Kids Moral Stories",
      "author": "David Warner",
      "image": "assets/images/Mask group.png",
      "price": "349",
      "description": "A fun storybook to develop moral values."
    },
    {
      "title": "Kids Moral Stories",
      "author": "David Warner",
      "image": "assets/images/Mask group.png",
      "price": "7411",
      "description": "Beautiful stories that teach life lessons."
    },
    {
      "title": "Princess Dream Tales",
      "author": "Clara Moon",
      "image": "assets/images/Mask group.png",
      "price": "199",
      "description": "Lovely stories for little princess dreamers."
    },
    {
      "title": "My First ABC Book",
      "author": "Emily Parker",
      "image": "assets/images/Mask group.png",
      "price": "753",
      "description": "A colorful ABC introduction for toddlers."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final h = SizeConfig.screenHeight;
    final w = SizeConfig.screenWidth;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: CustomAppBar1(
        title: 'E-books',
        actions: [],
        issetting: false,
        isdocuments: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),

        child: GridView.builder(
          itemCount: books.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),

          itemBuilder: (context, index) {
            final data = books[index];

            final String priceString = data["price"] ?? "0";
            final bool isFree = priceString.toLowerCase() == "free";

            /// Convert price safely
            final double priceValue =
            isFree ? 0.0 : double.tryParse(priceString) ?? 0.0;

            return GestureDetector(
              onTap: () {
                /// GO ROUTER NAVIGATION
                context.push(
                  "/book-details",
                  extra: {
                    "title": data["title"],
                    "author": data["author"],
                    "image": data["image"],
                    "price": priceValue,
                    "description": data["description"],
                    "isFree": isFree,
                  },
                );
              },

              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF5EFE1),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IMAGE
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          data["image"]!,
                          height: h * 0.20,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // TITLE
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        data["title"]!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),

                    // AUTHOR
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                      child: Text(
                        data["author"]!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// PRICE + BUTTON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // PRICE TEXT
                          Text(
                            isFree ? "₹0" : "₹$priceString",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration:
                              isFree ? TextDecoration.lineThrough : null,
                              decorationThickness: 2,
                            ),
                          ),

                          // BUY / FREE BUTTON
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 5),
                            decoration: BoxDecoration(
                              color: isFree
                                  ? Colors.green
                                  : const Color(0xFFFEBE01),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              isFree ? "Free" : "Buy",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
