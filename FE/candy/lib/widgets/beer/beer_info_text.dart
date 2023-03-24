import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerInfoText extends StatelessWidget {
  final String title;
  final String value;

  const BeerInfoText({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Margin(marginType: MarginType.width, size: 16),
        Text(value),
        if (title == '원산지')
          const Margin(marginType: MarginType.width, size: 16),
        if (title == '원산지')
          Image.asset(
            'assets/images/countries/$value.${value == '한국' ? 'jpg' : 'gif'}',
            width: 20,
          ),
      ],
    );
  }
}