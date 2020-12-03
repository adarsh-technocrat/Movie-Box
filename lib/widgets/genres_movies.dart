import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:moviebox/Models/movieModel.dart';
import 'package:moviebox/Models/movie_response.dart';
import 'package:moviebox/bloc/get_movie_ByGenres.dart';
import 'package:moviebox/style/theme.dart' as Style;
import 'package:progress_indicators/progress_indicators.dart';

class GenresMovies extends StatefulWidget {
  final int genreId;
  final String genresName;

  const GenresMovies({Key key, this.genresName, this.genreId})
      : super(key: key);
  @override
  _GenresMoviesState createState() => _GenresMoviesState();
}

class _GenresMoviesState extends State<GenresMovies> {
  @override
  void initState() {
    getmovieByGeners..getMoviesByGenre(widget.genreId);
    print(widget.genreId);
    super.initState();
  }

  @override
  void dispose() {
    getmovieByGeners.drainStrean();
    print("Subject Status:- drain");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.secondryColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.primaryColor,
        title: Text(widget.genresName),
        centerTitle: true,
      ),
      body: StreamBuilder<MovieResponse>(
        stream: getmovieByGeners.subject.stream,
        builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildMovieByGenres(snapshot.data);
          } else if (snapshot.hasData) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CollectionScaleTransition(
            repeat: true,
            children: <Widget>[
              Icon(
                Icons.movie,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.playlist_play,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                FontAwesome.film,
                size: 50,
                color: Colors.white,
              ),
            ],
          ),
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

  _buildMovieByGenres(MovieResponse data) {
    List<Movie> movies = data.movies;
    return GridView.builder(
      cacheExtent: 9999,
      itemCount: movies.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.50,
      ),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 10,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/original/" +
                        movies[index].poster,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 172,
                      width: 120,
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
                    errorWidget: (context, url, error) => Container(
                      height: 170,
                      width: 120,
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
                        Icons.error,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          movies[index].title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    movies[index].releasedate.substring(0, 4),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
