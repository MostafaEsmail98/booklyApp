import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:bookly/Features/search/presentation/view/widgets/search_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'CustomSearch.dart';
import 'custom_suggest_item.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});


  @override
  Widget build(BuildContext context) {
    return   SafeArea(
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
    );
  }
}
