import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/repo/search_repo_impl.dart';
import '../../manager/search/search_cubit.dart';

class SearchBarTextField extends StatefulWidget {
  const SearchBarTextField({super.key});



  @override
  State<SearchBarTextField> createState() => _SearchBarTextFieldState();
}

class _SearchBarTextFieldState extends State<SearchBarTextField> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>())
        ..fetchSearch(textController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          hintText: 'Search',
          suffixIcon: IconButton(
              onPressed: () {
                context.read<SearchCubit>().fetchSearch(textController.text);
              },
              icon: const Icon(Icons.search))),
    );
  }
}
