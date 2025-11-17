import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/color_constants.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final bool issetting;
  final bool isdocuments;
  final List<Widget> actions;

  const CustomAppBar1({Key? key, required this.title, required this.actions,this.color,
 required this.issetting,required this.isdocuments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
          backgroundColor: color??Colors.black,
          centerTitle:isdocuments,

          leading:  (!issetting) ?  IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              context.pop(true);
            },
            icon: const Icon(Icons.arrow_back, size: 24, color: Colors.white),
          )
              : null,
          title: Text(
            title,
            textAlign: isdocuments ? TextAlign.center : TextAlign.start,
            style:  TextStyle(
              color: Colors.white,
              fontSize: isdocuments ? 16:20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: actions,
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
