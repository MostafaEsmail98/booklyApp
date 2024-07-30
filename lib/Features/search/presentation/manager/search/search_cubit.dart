
import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:bookly/Features/search/presentation/manager/search/search_state.dart';


import 'package:flutter_bloc/flutter_bloc.dart';



class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(InitialState());
  final SearchRepo searchRepo ;


  Future<void> fetchSearch(String name) async {
    emit(InitialState());
    var result = await searchRepo.fetchDataOfSearch(name);
    result.fold((failure) {
      emit(FailureState(failure.errMessage));
    }, (success) {
      emit(SuccessState(success));
    });
  }
}