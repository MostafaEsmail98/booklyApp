
import '../../../../homePage/data/models/BookModel.dart';

abstract class SearchState {}

class InitialState extends SearchState {}
class LoadingState extends SearchState {}
class SuccessState extends SearchState {
  List <Items> books ;
  SuccessState(this.books);
}
class FailureState extends SearchState {
  String errMessage ;
  FailureState(this.errMessage);
}