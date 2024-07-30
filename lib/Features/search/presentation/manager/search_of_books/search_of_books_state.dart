
import '../../../../homePage/data/models/BookModel.dart';

abstract class SearchOfBooksState {}

class InitialState extends SearchOfBooksState {}
class LoadingState extends SearchOfBooksState {}
class SuccessState extends SearchOfBooksState {
  List <Items> books ;
  SuccessState(this.books);
}
class FailureState extends SearchOfBooksState {
  String errMessage ;
  FailureState(this.errMessage);
}