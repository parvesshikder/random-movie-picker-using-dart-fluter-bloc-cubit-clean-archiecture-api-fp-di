import 'package:equatable/equatable.dart';

class RandomMovieEntities extends Equatable {
  final String movieName;
  final String movieBannerUrl;
  final String movieDirectorName;
  final String movieRatingScore;
  final String movieDuration;

  RandomMovieEntities({
    required this.movieName,
    required this.movieBannerUrl,
    required this.movieDirectorName,
    required this.movieRatingScore,
    required this.movieDuration,
  });

  @override
  List<Object?> get props => [
        movieName,
        movieBannerUrl,
        movieDirectorName,
        movieRatingScore,
        movieDuration
      ];
}
