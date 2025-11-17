import 'package:clientapp_studio/Components/CutomAppBar.dart';
import 'package:flutter/material.dart';

class DownLoadHistory extends StatefulWidget {
  const DownLoadHistory({super.key});

  @override
  State<DownLoadHistory> createState() => _DownLoadHistoryState();
}

class _DownLoadHistoryState extends State<DownLoadHistory> {

  // Dummy Backend Data (You will replace this later)
  final List<Map<String, dynamic>> history = [
    {
      "title": "Wedding Album",
      "date": "Downloaded on 12 Jan 2025"
    },
    {
      "title": "Pre-Wedding Shoot",
      "date": "Downloaded on 05 Jan 2025"
    },
    {
      "title": "Birthday Highlight Video",
      "date": "Downloaded on 28 Dec 2024"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar1(title: 'Download History', actions: [], issetting: false,isdocuments: false,),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.015),

        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: h * 0.015),

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.018),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE
                    Text(
                      history[index]["title"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: w * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 6),

                    /// SUBTEXT (Downloaded Date)
                    Text(
                      history[index]["date"],
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: w * 0.036,
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
