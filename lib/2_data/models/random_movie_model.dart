import 'package:random_movie/1_domain/entities/random_movie_entities.dart';

class RandomMovieModel extends RandomMovieEntities {
  RandomMovieModel({
    required String movieName,
    required String movieBannerUrl,
    required String movieDirectorName,
    required String movieRatingScore,
    required String movieDuration,
  }) : super(
          movieName: movieName,
          movieBannerUrl: movieBannerUrl,
          movieDirectorName: movieDirectorName,
          movieRatingScore: movieRatingScore,
          movieDuration: movieDuration,
        );

  factory RandomMovieModel.fromJson(Map<String, dynamic> json) {
    return RandomMovieModel(
      movieBannerUrl: json['Poster'],
      movieDirectorName: json['Director'],
      movieDuration: json['Runtime'] ,
      movieName: json['Title'],
      movieRatingScore: json['imdbRating'],
    );
  }
}


