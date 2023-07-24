import 'package:flutter/material.dart';
import 'package:random_movie/0_application/core/constants/constnats.dart';

class MovieCard extends StatelessWidget {
  //property to get movie data
  final String movieName;
  final String movieDuration;
  final String movieDirector;
  final String movieBannerUrl;
  final String movieRatingScore;

  const MovieCard(
      {super.key,
      required this.movieName,
      required this.movieDuration,
      required this.movieDirector,
      required this.movieBannerUrl,
      required this.movieRatingScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 97, 97, 97).withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 15,
        offset: const Offset(0, 0), // changes x,y position of shadow
      ),
    ],
      ),
      //stack to make movie card
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topEnd,
        fit: StackFit.loose,
        children: <Widget>[
          //card background
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
                color: almostBlack, borderRadius: BorderRadius.circular(1)),
          ),

          Positioned(
            top: -40,
            left: 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                children: [
                  //
                  //movie banner image
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 180,
                      child: Image.network(
                        movieBannerUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  //
                  // Movie Details from map
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              movieName,
                              style: const TextStyle(
                                fontSize: 16,
                                color: mainTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2, // Limit to two lines
                              overflow: TextOverflow
                                  .ellipsis, 
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Director: $movieDirector',
                              style: const TextStyle(
                                fontSize: 13,
                                color: grey,
                              ),
                              maxLines: 2, // Limit to two lines
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis if text overflows
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Time: $movieDuration',
                              style: const TextStyle(
                                fontSize: 13,
                                color: grey,
                              ),
                              maxLines: 2, // Limit to two lines
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis if text overflows
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '⭐ $movieRatingScore',
                              style: const TextStyle(
                                fontSize: 18,
                                color: yellow,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
