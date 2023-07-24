import 'dart:convert';
import 'dart:math' as math;
import 'package:random_movie/0_application/core/constants/constnats.dart';
import 'package:random_movie/2_data/exceptions/exception.dart';
import 'package:random_movie/2_data/models/random_movie_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomMovieDatasource {
  Future<RandomMovieModel> getMovieFromApi();
}

class RandomMovieDatasourceImpls extends RandomMovieDatasource {
  final http.Client client;
  final math.Random random;

  RandomMovieDatasourceImpls({required this.client, required this.random});

  @override
  Future<RandomMovieModel> getMovieFromApi() async {
    final newyear = _generateRandomYear();
    // Construct the URL for the API call
    String apiUrl =
        'https://www.omdbapi.com/?apikey=$apiKey&t=$title&y=$newyear&plot=$plot';
    final response = await http.get(Uri.parse(apiUrl));

    print(response.statusCode);

    if (response.statusCode != 200) {
      throw ServerExceptions();
    } else {
      final responseBody = json.decode(response.body);

      return RandomMovieModel.fromJson(responseBody);
    }
  }

  String _generateRandomYear() {
    // Replace this with your logic to generate a random movie year
    int minYear = 2000;
    int maxYear = 2023;
    return (minYear + random.nextInt(maxYear - minYear + 1)).toString();
  }
}
