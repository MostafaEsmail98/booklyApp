import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_list_view_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.books});
  final Items books ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomListViewItem(bookModel: books,),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          books.volumeInfo!.title!,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            books.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }
}
