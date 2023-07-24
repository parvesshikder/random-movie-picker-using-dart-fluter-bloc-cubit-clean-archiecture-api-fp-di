import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_movie/0_application/pages/random_movie/random_movie_page.dart';
import 'package:random_movie/injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const RandomMovieApp());
}

class RandomMovieApp extends StatelessWidget {
  const RandomMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //add google fonts
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const RandomMoviePageWrapperProvider(),
    );
  }
}
