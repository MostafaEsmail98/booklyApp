import '../../../data/models/BookModel.dart';

abstract class FeaturedBooksState {

  const FeaturedBooksState();
}

class BooklyInitial extends FeaturedBooksState{}
class BooklyLoading extends FeaturedBooksState{}
class BooklyFailure extends FeaturedBooksState{
  final String errMessage ;
  const BooklyFailure(this.errMessage);

}
class BooklySuccess extends FeaturedBooksState{
  final List<Items> books ;

  const BooklySuccess(this.books);
}