import 'package:flutter/material.dart';

class BeerImage extends StatelessWidget {
  final double radiusSize;
  final double backSize;
  final Color backColor;
  final String beerImgSrc;

  const BeerImage({
    super.key,
    required this.radiusSize,
    required this.backSize,
    required this.backColor,
    required this.beerImgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: backSize,
      height: backSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusSize),
        color: backColor,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 221, 219, 216).withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 5.0,
            offset: const Offset(3, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Image.network(
          beerImgSrc,
        ),
      ),
    );
  }
}
