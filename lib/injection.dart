import 'package:get_it/get_it.dart';
import 'package:random_movie/0_application/pages/random_movie/cubit/random_movie_cubit.dart';
import 'package:random_movie/1_domain/repositories/random_movie_repo.dart';
import 'package:random_movie/1_domain/usecases/random_movie_usecases.dart';
import 'package:random_movie/2_data/datasources/random_move_datasource.dart';
import 'package:random_movie/2_data/repositories/random_move_repo_imple.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

final sl = GetIt.I; // sl (service locator)

Future<void> init() async {
  sl.registerFactory(() => RandomMovieCubit(randomMovieUseCase: sl()));
  sl.registerFactory(() => RandomMovieUseCase(randomMovieRepo: sl()));
  sl.registerFactory<RandomMovieRepo>(
      () => RandomMovieRepoImpls(randomMovieDatasource: sl()));
  sl.registerFactory<RandomMovieDatasource>(
      () => RandomMovieDatasourceImpls(client: sl(), random: sl()));

  sl.registerFactory(() => http.Client());
  sl.registerFactory(() => math.Random());
}
