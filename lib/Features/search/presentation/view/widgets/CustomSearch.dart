
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/custom_error.dart';
import '../../../../homePage/presentation/views/widgets/custom_list_view_item_best_seller.dart';
import '../../manager/search/search_cubit.dart';
import '../../manager/search/search_state.dart';

class CustomItem extends StatelessWidget {
  const CustomItem ({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder <SearchCubit,SearchState>(
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
          return  CustomError(errMessage: state.errMessage);
          }
          return const Center(child: Text("Type to search"),);
        }
    );
  }
}