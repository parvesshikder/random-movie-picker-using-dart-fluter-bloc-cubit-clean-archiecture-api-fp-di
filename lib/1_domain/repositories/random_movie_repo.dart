import 'package:dartz/dartz.dart';
import 'package:random_movie/1_domain/entities/random_movie_entities.dart';
import 'package:random_movie/1_domain/failures/failures.dart';

abstract class RandomMovieRepo {
  Future<Either<Failure, RandomMovieEntities>> getMovieFromDataScouce();
}
