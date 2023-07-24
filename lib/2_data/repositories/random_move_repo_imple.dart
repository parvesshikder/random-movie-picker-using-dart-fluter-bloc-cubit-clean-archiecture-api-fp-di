// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:random_movie/1_domain/failures/failures.dart';
import 'package:random_movie/1_domain/repositories/random_movie_repo.dart';
import 'package:random_movie/2_data/datasources/random_move_datasource.dart';
import 'package:random_movie/2_data/exceptions/exception.dart';
import 'package:random_movie/2_data/models/random_movie_model.dart';

class RandomMovieRepoImpls extends RandomMovieRepo {

  RandomMovieDatasource randomMovieDatasource;
  
  RandomMovieRepoImpls({
    required this.randomMovieDatasource,
  });

  @override
  Future<Either<Failure, RandomMovieModel>> getMovieFromDataScouce() async {
    try {
      final movie = await randomMovieDatasource.getMovieFromApi();
      return right(movie);
    } catch (e) {
      return left(ServerExceptions());
    }
  }
}
