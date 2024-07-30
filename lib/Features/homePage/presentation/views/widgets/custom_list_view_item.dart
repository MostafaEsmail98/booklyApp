import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:bookly/core/utils/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewItem extends StatelessWidget {


  CustomListViewItem( {super.key, required this.bookModel});
  final Items bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push("/bookView",extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 2.7 / 4,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
