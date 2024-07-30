import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:bookly/Features/search/presentation/manager/search_of_books/search_of_books_cubit.dart';
import 'package:bookly/Features/search/presentation/manager/search_of_books/search_of_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/custom_error.dart';
import '../../../../homePage/presentation/views/widgets/custom_list_view_item_best_seller.dart';

class CustomSuggestItem extends StatelessWidget {
  const CustomSuggestItem ({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder <SearchOfBooksCubit,SearchOfBooksState>(
        builder: (context,state) {
          if (state is SuccessState){
            return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return  CustomBestSellerItem(state.books[index]);
                });
          }
          else if (state is FailureState){
            CustomError(errMessage: state.errMessage);
          }
          return const Center(child: CircularProgressIndicator(),);
        }
    );
  }
}