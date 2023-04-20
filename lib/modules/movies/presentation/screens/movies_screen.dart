import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utilities/constants.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_events.dart';
import '../widgets/now_playing.dart';
import '../widgets/popular.dart';
import '../widgets/top_rated.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MoviesBloc(sl(), sl(), sl())
        ..add(NowPlayingMoviesEvent())
        ..add(PopularMoviesEvent())
        ..add(TopRatedMoviesEvent()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Constants.primaryColor,
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlaying(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: 
                   
                      Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                     
                    
                
                ),
                const Popular(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: 
                    
                      Text(
                        "Top Rated",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      
                   
                  
                ),
                const TopRated(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
