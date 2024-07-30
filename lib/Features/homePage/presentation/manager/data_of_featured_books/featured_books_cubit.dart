import 'package:bookly/Features/homePage/data/repo/home_repo.dart';
import 'package:bookly/Features/homePage/presentation/manager/data_of_featured_books/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(BooklyInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(BooklyLoading());
    var result = await homeRepo.fetchDataOfFeaturedBooks();
    result.fold((failure) {
      emit(BooklyFailure(failure.errMessage));
    }, (success) {
      emit(BooklySuccess(success));
    });
  }
}
