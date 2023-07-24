import 'package:dartz/dartz.dart';
import 'package:random_movie/1_domain/entities/random_movie_entities.dart';
import 'package:random_movie/1_domain/failures/failures.dart';
import 'package:random_movie/1_domain/repositories/random_movie_repo.dart';
import 'package:random_movie/2_data/repositories/random_move_repo_imple.dart';

class RandomMovieUseCase {
  final RandomMovieRepo randomMovieRepo;

  RandomMovieUseCase({required this.randomMovieRepo});

  Future<Either<Failure, RandomMovieEntities>> getMovie() async {
    return randomMovieRepo.getMovieFromDataScouce();
  }
}
