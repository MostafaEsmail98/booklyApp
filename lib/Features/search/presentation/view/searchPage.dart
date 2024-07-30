
import 'package:bookly/Features/search/presentation/manager/search_of_books/search_of_books_cubit.dart';
import 'package:bookly/Features/search/presentation/view/widgets/search_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../homePage/data/models/BookModel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  const SearchPageBody();
  }
}
