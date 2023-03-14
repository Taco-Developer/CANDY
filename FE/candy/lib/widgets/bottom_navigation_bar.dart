import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.home_outlined),
            Image.asset(
              'assets/images/barcode.png',
              width: 24,
              height: 24,
            ),
            const Icon(Icons.person_2_outlined)
          ],
        ),
      ),
    );
  }
}
