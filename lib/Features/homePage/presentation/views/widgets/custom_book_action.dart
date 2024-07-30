import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/models/BookModel.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.books});
  final Items books ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                )),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Free",
                  style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xffEF8262),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )),
            child: TextButton(
              onPressed: () async{
                Uri _url = Uri.parse(books.volumeInfo!.previewLink!);
                if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
                }
              },
              child: Text(
                "Preview",
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
