import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:random_movie/0_application/core/constants/constnats.dart';
import 'package:random_movie/0_application/pages/random_movie/cubit/random_movie_cubit.dart';
import 'package:random_movie/0_application/pages/random_movie/widgets/custom_button.dart';
import 'package:random_movie/0_application/pages/random_movie/widgets/movie_card.dart';
import 'package:random_movie/injection.dart';

// Wrapper class to provide RandomMovieCubit
class RandomMoviePageWrapperProvider extends StatelessWidget {
  const RandomMoviePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RandomMovieCubit>(),
      child: const RandomMoviePage(),
    );
  }
}

class RandomMoviePage extends StatelessWidget {
  const RandomMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: pureBlack,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Random Movie Picker',
                style: TextStyle(
                  fontSize: 22,
                  color: mainTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 200,
              ),

              //
              //Bloc provider to access RandomMovieCubit functions and RandomMovieState

              BlocBuilder<RandomMovieCubit, RandomMovieState>(
                builder: (context, state) {
                  //check current state
                  //update state accordingly
                  if (state is RandomMovieInitial) {
                    return Lottie.asset(searchIconAnimated);
                  } else if (state is RandomMovieLoading) {
                    return SizedBox(
                        height: 200,
                        child: Lottie.asset(
                          videoSearchIcon,
                          fit: BoxFit.contain,
                          repeat: true,
                        ));
                  } else if (state is RandomMovieLoaded) {
                    return MovieCard(
                        movieBannerUrl: state.movieBannerUrl,
                        movieDirector: state.movieDirector,
                        movieDuration: state.movieDuration,
                        movieName: state.movieName,
                        movieRatingScore: state.movieRatingScore);
                  } else if (state is RandomMovieError) {
                    return Column(
                      children: [
                        Text(
                          state.errorMessage,
                          style: const TextStyle(
                            fontSize: 22,
                            color: mainTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                        height: 120,
                        child: Lottie.asset(
                          error,
                          fit: BoxFit.contain,
                          repeat: true,
                        )),
                      ],
                    );
                  }

                  //default if no state is matched
                  return const Text(
                    'Unknown Error',
                    style: TextStyle(
                      fontSize: 22,
                      color: mainTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: Container()),
              CustomButton(
                onPress: () {
                  //access RandomMovieCubit function
                  //trigger getMovie button and request movie data to domain layer
                  BlocProvider.of<RandomMovieCubit>(context).requestMovie();
                },
                color: trueBlue,
                textColor: Colors.white,
                child: const Text('Get Movie'),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
