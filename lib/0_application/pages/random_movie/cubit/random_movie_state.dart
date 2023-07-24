part of 'random_movie_cubit.dart';

@immutable
abstract class RandomMovieState extends Equatable {
  //equtable to compare objects
  @override
  List<Object?> get props => [];
}

class RandomMovieInitial extends RandomMovieState {}

//display loding indicator while retriving movie data
class RandomMovieLoading extends RandomMovieState {}

//loaded state passing movie data
class RandomMovieLoaded extends RandomMovieState {
  //property to get movie data
  final String movieName;
  final String movieDuration;
  final String movieDirector;
  final String movieBannerUrl;
  final String movieRatingScore;

  RandomMovieLoaded(
      {required this.movieName,
      required this.movieDuration,
      required this.movieDirector,
      required this.movieBannerUrl,
      required this.movieRatingScore});

  @override
  List<Object?> get props => [];
}

//error state passing error message
class RandomMovieError extends RandomMovieState {
  final String errorMessage;

  RandomMovieError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
