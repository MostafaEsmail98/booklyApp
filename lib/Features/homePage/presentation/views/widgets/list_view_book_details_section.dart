import 'package:bookly/Features/homePage/presentation/manager/details_of_books/details_of_books_cubit.dart';
import 'package:bookly/Features/homePage/presentation/manager/details_of_books/details_of_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/custom_error.dart';
import 'custom_list_view_item.dart';

class ListViewBooks extends StatelessWidget {
  const ListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsOfBooksCubit, DetailsOfBooksState>(
        builder: (context, state) {
      if (state is BooklySuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomListViewItem(
                    bookModel: state.books[index],);
              }),
        );
      } else if (state is BooklyFailure) {
        CustomError(errMessage: state.errMessage);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
