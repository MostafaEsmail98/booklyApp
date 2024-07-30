
import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:bookly/Features/search/presentation/manager/search_of_books/search_of_books_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



class SearchOfBooksCubit extends Cubit<SearchOfBooksState> {
  SearchOfBooksCubit(this.searchRepo) : super(InitialState());
final SearchRepo searchRepo ;

  Future<void> fetchSearchOfBooks() async {
    emit(InitialState());
    var result = await searchRepo.fetchDataOfSearchBooks();
    result.fold((failure) {
      emit(FailureState(failure.errMessage));
    }, (success) {
      emit(SuccessState(success));
    });
  }
}