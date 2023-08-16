import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final String title;
  const CustomAppBar({super.key, this.preferredSize=const Size.fromHeight(55.0), required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Icon(Icons.add),
        Icon(Icons.favorite),
        Icon(Icons.message)
      ],
      automaticallyImplyLeading: true,
    );
  }

}
