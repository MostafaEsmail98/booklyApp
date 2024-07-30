import '../../../data/models/BookModel.dart';

abstract class DetailsOfBooksState {

  const DetailsOfBooksState();
}

class BooklyInitial extends DetailsOfBooksState{}
class BooklyLoading extends DetailsOfBooksState{}
class BooklyFailure extends DetailsOfBooksState{
  final String errMessage ;
  const BooklyFailure(this.errMessage);

}
class BooklySuccess extends DetailsOfBooksState{
  final List<Items> books ;

  const BooklySuccess(this.books);
}