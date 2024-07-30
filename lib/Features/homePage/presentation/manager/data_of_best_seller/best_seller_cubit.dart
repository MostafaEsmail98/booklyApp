import 'package:bookly/Features/homePage/data/repo/home_repo.dart';
import 'package:bookly/Features/homePage/presentation/manager/data_of_best_seller/best_seller_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerCubit extends Cubit<BestSellerState>{
  BestSellerCubit(this.homeRepo): super(InitialState());
  final HomeRepo homeRepo ;

  Future <void> fetchBestSeller () async {
    emit(LoadingState());
    var result = await homeRepo.fetchDataOfBestSeller();
    result.fold((failure){
      emit(FailureState(failure.errMessage));
    }, (success){
      emit(SuccessState(success));
    });
  }

}