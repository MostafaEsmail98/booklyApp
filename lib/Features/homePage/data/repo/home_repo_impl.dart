

import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:bookly/Features/homePage/data/repo/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failures, List<Items>>> fetchDataOfBestSeller() async{
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
  Future<Either<Failures, List<Items>>> fetchDataOfFeaturedBooks() async{
    try
    {
      var data = await apiServices.get("volumes?q=subject:computer science&Filtering=free-ebooks");
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
  Future<Either<Failures, List<Items>>> fetchDetailsOfBooks({required String category}) async{
    try
    {
      var data = await apiServices.get("volumes?q=subject:computer science&Filtering=free-ebooks&Sorting=relevance");
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