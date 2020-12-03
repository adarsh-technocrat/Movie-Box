import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:moviebox/style/theme.dart' as Style;
import 'package:moviebox/widgets/TrendingMovieSction.dart';
import 'package:moviebox/widgets/genres.dart';
import 'package:moviebox/widgets/nowPlaying.dart';
import 'package:moviebox/widgets/trendingTvSection.dart';
import 'package:moviebox/widgets/nowPlayingTvOnAir.dart';

class MovieBoxHome extends StatefulWidget {
  @override
  _MovieBoxHomeState createState() => _MovieBoxHomeState();
}

class _MovieBoxHomeState extends State<MovieBoxHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.primaryColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.primaryColor,
        leading: Icon(
          FontAwesome.film,
          size: 30,
        ),
        title: Text("Movies & TV"),
        actions: [
          IconButton(
              icon: Icon(
                FontAwesome.search,
                size: 20,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: [
          NowPlaying(),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 10,
                  ),
                  child: Text(
                    "Trending in movies",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                TrendingMovieSction(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GenresMovie(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          NowplayingtvOnAir(),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 10,
                  ),
                  child: Text(
                    "Trending in TV",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                TrendingTvSction(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
