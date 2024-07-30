import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:bookly/Features/homePage/presentation/manager/details_of_books/details_of_books_cubit.dart';
import 'package:bookly/Features/homePage/presentation/views/widgets/custom_rating_book.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_details_section.dart';
import 'custom_book_action.dart';
import 'custom_book_details_app_bar.dart';
import 'list_view_book_details_section.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key, required this.books});

  final Items books;

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailsOfBooksCubit>(context).fetchDetailsOfBooks(
        category: widget.books.volumeInfo?.categories?[0] ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                  child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                   BookDetailsSection(books: widget.books,),
                  const SizedBox(
                    height: 7,
                  ),
                  const RatingBook(),
                  const SizedBox(
                    height: 20,
                  ),
                   BookAction(books: widget.books,),
                  const Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You can also like",
                        style: Styles.textStyle14
                            .copyWith(fontWeight: FontWeight.bold),
                      )),
                   const ListViewBooks(),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
