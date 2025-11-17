import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/color_constants.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final bool issetting;
  final List<Widget> actions;

  const CustomAppBar1({Key? key, required this.title, required this.actions,this.color,
 required this.issetting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      AppBar(
        backgroundColor: color??Colors.black,
        centerTitle: false,

        leading:  (!issetting) ?  IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: () {
            context.pop(true);
          },
          icon: InkWell(
              onTap: ()
              {
                context.pop();
              },
              child: const Icon(Icons.arrow_back, size: 24, color: Colors.white)),
        )
            : null,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions,
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
