import 'package:flutter/material.dart';
import 'package:moviebox/Models/genresModel.dart';
import 'package:moviebox/Models/genres_response.dart';
import 'package:moviebox/bloc/get_genres_bloc.dart';
import 'package:moviebox/widgets/genres_list.dart';

class GenresMovie extends StatefulWidget {
  @override
  _GenresMovieState createState() => _GenresMovieState();
}

class _GenresMovieState extends State<GenresMovie> {
  @override
  void initState() {
    genresListBlock..getgenresMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenresResponse>(
      stream: genresListBlock.subject.stream,
      builder: (context, AsyncSnapshot<GenresResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.errors != null && snapshot.data.errors.length > 0) {
            return _buildErrorWidget(snapshot.data.errors);
          }
          return _buildGenresWidget(snapshot.data);
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

  _buildGenresWidget(GenresResponse data) {
    List<Genres> genres = data.genres;
    if (genres.length == 0) {
      return Container(
        child: Text("No Genres"),
      );
    } else
      return GenersList(
        genres: genres,
      );
  }
}
