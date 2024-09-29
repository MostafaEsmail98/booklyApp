import 'package:bookly/Features/search/presentation/manager/search/search_cubit.dart';
import 'package:bookly/Features/search/presentation/view/widgets/search_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/api_services.dart';
import '../../../data/repo/search_repo_impl.dart';
import 'CustomSearch.dart';


class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl(ApiServices(Dio()))),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SearchBarTextField(),
                const SizedBox(
                  height: 5,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Search Result",
                      style: Styles.textStyle16,
                    )),
                const Expanded(
                  child: CustomItem(),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
