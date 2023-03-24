import 'package:flutter/material.dart';

class BeerDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  const BeerDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 24,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            size: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_rounded,
            size: 24,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}