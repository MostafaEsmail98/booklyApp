import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class RatingBook extends StatelessWidget {
  const RatingBook({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        const Text(
          "4.8",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 4,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            "(7883)",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}
