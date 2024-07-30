import 'package:bookly/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60,bottom: 15),
      child: Row(
        children: [
          Image.asset(GetImages.logo,height: 16,),
          const Spacer(),
          IconButton(onPressed: () {
            GoRouter.of(context).push('/searchPage',);
          }, icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
}
