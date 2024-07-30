import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
 Future<Either<Failures,List<Items>>> fetchDataOfBestSeller ();
 Future<Either<Failures,List<Items>>>  fetchDataOfFeaturedBooks ();
 Future<Either<Failures,List<Items>>>  fetchDetailsOfBooks ({required String category});
}