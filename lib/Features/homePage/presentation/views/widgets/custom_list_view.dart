import 'package:bookly/Features/homePage/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly/core/errors/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/data_of_featured_books/featured_books_cubit.dart';
import '../../manager/data_of_featured_books/featured_books_state.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is BooklySuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomListViewItem(
                    bookModel: state.books[index],
                  );
                }),
          );
        } else if (state is BooklyFailure) {
          return CustomError(errMessage: state.errMessage);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
