import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviebox/Models/genresModel.dart';
import 'package:moviebox/style/theme.dart' as Style;
import 'package:moviebox/widgets/genres_movies.dart';

class GenersList extends StatefulWidget {
  final List<Genres> genres;

  const GenersList({Key key, @required this.genres}) : super(key: key);
  @override
  _GenersListState createState() => _GenersListState();
}

class _GenersListState extends State<GenersList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.genres.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Style.Colors.secondryColor,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => GenresMovies(
                                genreId: widget.genres[index].id,
                                genresName:
                                    widget.genres[index].name + "\tmovies",
                              )));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Text(
                      widget.genres[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
