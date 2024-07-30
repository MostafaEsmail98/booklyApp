import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_services.dart';
import '../../../homePage/data/models/BookModel.dart';

class SearchRepoImpl extends SearchRepo {

  final ApiServices apiServices;
  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<Failures, List<Items>>> fetchDataOfSearchBooks() async{
    try
    {
      var data = await apiServices.get("volumes?q=programming&Filtering=free-ebooks&Sorting=newest");
      List<Items> books = [];
      for (var item in data["items"]){
        books.add(Items.fromJson(item));
      }
      return Right(books);
    }
    catch (e){
      if (e is DioException){
        return Left(ServicesError.fromDioError(e));
      }
      return Left(ServicesError(e.toString()));

    }
  }

  @override
  Future<Either<Failures, List<Items>>> fetchDataOfSearch(String name)async {
    try
    {
      var data = await apiServices.get("volumes?q=$name&Filtering=free-ebooks&Sorting=newest");
      List<Items> books = [];
      for (var item in data["items"]){
        books.add(Items.fromJson(item));
      }
      return Right(books);
    }
    catch (e){
      if (e is DioException){
        return Left(ServicesError.fromDioError(e));
      }
      return Left(ServicesError(e.toString()));

    }
  }


}