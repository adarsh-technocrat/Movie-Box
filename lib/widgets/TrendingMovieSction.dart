import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviebox/Models/TrendingMovies/trendingMovie.dart';
import 'package:moviebox/Models/TrendingMovies/trendingMovieResponse.dart';
import 'package:moviebox/bloc/get_trending_movie.dart';
import 'package:moviebox/style/theme.dart' as Style;

class TrendingMovieSction extends StatefulWidget {
  @override
  _TrendingMovieSctionState createState() => _TrendingMovieSctionState();
}

class _TrendingMovieSctionState extends State<TrendingMovieSction> {
  @override
  void initState() {
    trendingmovielistbloc..gettrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TrendingMovieResponse>(
      stream: trendingmovielistbloc.subject.stream,
      builder: (context, AsyncSnapshot<TrendingMovieResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildtrendingmovieList(snapshot.data);
        } else if (snapshot.hasData) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error",
              style: TextStyle(
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  _buildtrendingmovieList(TrendingMovieResponse data) {
    List<TrendingMovie> trendingmovies = data.trendingmovies;
    if (trendingmovies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("No Trending Movies")],
        ),
      );
    } else {
      return Container(
        height: 230,
        child: ListView.builder(
          cacheExtent: 9999,
          scrollDirection: Axis.horizontal,
          itemCount: trendingmovies.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: 120,

                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        // image: DecorationImage(
                        //   image: NetworkImage(
                        //     "https://image.tmdb.org/t/p/original/" +
                        //         trendingmovies[index].poster,
                        //   ),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: "https://image.tmdb.org/t/p/original/" +
                            trendingmovies[index].poster,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(1.0),
                                Style.Colors.primaryColor.withOpacity(0.1),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [
                                0.0,
                                0.9,
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.photo_album,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      // Image.network(
                      // "https://image.tmdb.org/t/p/original/" +
                      //     trendingmovies[index].poster,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 120,
                      color: Color(0xff1D323D),
                      child: Center(
                        child: Text(
                          trendingmovies[index].title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
