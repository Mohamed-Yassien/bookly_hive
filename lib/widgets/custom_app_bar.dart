import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Notes App',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Spacer(),
        CustomSearchIcon(),
      ],
    );
  }
}
