import '../../../data/models/BookModel.dart';

abstract class BestSellerState {

  const BestSellerState();
}

class InitialState extends BestSellerState{}
class LoadingState extends BestSellerState{}
class FailureState extends BestSellerState{
  final String errMessage ;
  const FailureState(this.errMessage);

}
class SuccessState extends BestSellerState{
  final List<Items> books ;

  const SuccessState(this.books);
}