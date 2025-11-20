import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GeneralFiles extends StatefulWidget {
  const GeneralFiles({super.key});

  @override
  State<GeneralFiles> createState() => _GeneralFilesState();
}

class _GeneralFilesState extends State<GeneralFiles> {
  // Example preview images
  final List<String> demoImages = [
    "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () =>context.go('/dashboard'),
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
        centerTitle: true,
        title: const Text(
          "General Vault",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Uploads + New Upload button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Text(
                  "Uploads",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    context.push(
                      '/legacy-upload',
                      extra: {
                        "fromPath": "/general-files",
                        "appBarTitle": "Upload Document",
                        "uploadHeading": "Upload Your File",
                        "uploadInfoText": "PNG, JPG only",
                        "buttonText": "Upload",
                        "nextPath": "/general-files",
                      },
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xffF8B514)),
                  ),
                  child: const Text(
                    'New Upload',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF8B514),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔥 Staggered Image Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: demoImages.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      demoImages[index],
                      fit: BoxFit.cover,
                      height: index % 2 == 0 ? 180 : 240,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
