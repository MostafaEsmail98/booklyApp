import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../homePage/data/models/BookModel.dart';

abstract class SearchRepo {
  Future<Either<Failures,List<Items>>>  fetchDataOfSearchBooks ();
  Future<Either<Failures,List<Items>>>  fetchDataOfSearch (String name);
}