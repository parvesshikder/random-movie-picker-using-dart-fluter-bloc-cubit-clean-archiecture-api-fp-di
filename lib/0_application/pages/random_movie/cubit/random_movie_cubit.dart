import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_movie/0_application/core/constants/error_message_constants.dart';
import 'package:random_movie/1_domain/failures/failures.dart';
import 'package:random_movie/1_domain/usecases/random_movie_usecases.dart';

part 'random_movie_state.dart';

class RandomMovieCubit extends Cubit<RandomMovieState> {
  RandomMovieCubit({required this.randomMovieUseCase}) : super(RandomMovieInitial());

  final RandomMovieUseCase randomMovieUseCase;

  //send movie request to domain layer
  Future<void> requestMovie() async {
    //dispaly loading state
    emit(RandomMovieLoading());
    //delay by 3 seconds
    await Future.delayed(const Duration(seconds: 2));

    //get movie data from domain layer in sucess or failure formate
    final failureOrSuccess = await randomMovieUseCase.getMovie();

    //unfold
    failureOrSuccess.fold(
        (failure) => emit(RandomMovieError(errorMessage: _errorMapping(failure))),
        (success) => emit(RandomMovieLoaded(
            movieBannerUrl: success.movieBannerUrl,
            movieDirector: success.movieDirectorName,
            movieDuration: success.movieDuration,
            movieName: success.movieName,
            movieRatingScore: success.movieRatingScore)));
  }

  String _errorMapping(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailure;
      case GenarelFailure:
        return generelFailure;
      default:
        return unknownFailure;
    }
  }
}
