import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:bookly/Features/homePage/presentation/manager/data_of_best_seller/best_seller_cubit.dart';
import 'package:bookly/Features/homePage/presentation/manager/data_of_best_seller/best_seller_state.dart';
import 'package:bookly/core/errors/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view_item_best_seller.dart';

class CustomListViewBestSeller extends StatelessWidget {
  const CustomListViewBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <BestSellerCubit,BestSellerState>(
      builder: (context,state) {
       if (state is SuccessState){
         return ListView.builder(
             shrinkWrap: true,
             physics: const NeverScrollableScrollPhysics(),
             padding: EdgeInsets.zero,
             itemCount: state.books.length,
             itemBuilder: (context, index) {
               return  CustomBestSellerItem(state.books[index] );
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
