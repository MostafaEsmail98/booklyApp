import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errMessage});

  final String errMessage ;
  @override
  Widget build(BuildContext context) {
    return  Text(errMessage, style: Styles.textStyle18,);
  }
}
