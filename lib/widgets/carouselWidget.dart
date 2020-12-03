import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:moviebox/style/theme.dart' as Style;

class CorouselWidget extends StatelessWidget {
  const CorouselWidget({
    Key key,
    @required this.movies,
    @required this.status,
  }) : super(key: key);

  final List<dynamic> movies;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlay: true,
          viewportFraction: 1,
          aspectRatio: 1.0,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //     "https://image.tmdb.org/t/p/original/" +
                  //         movies[index].backPoster,
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/original/" +
                      movies[index].backPoster,
                  placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Style.Colors.primaryColor.withOpacity(0.0),
                            Colors.black.withOpacity(1.0),
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
                        FontAwesome.image,
                        color: Colors.grey,
                        size: 50,
                      )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                //  Image.network(
                // "https://image.tmdb.org/t/p/original/" +
                //     movies[index].backPoster,
                // ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Positioned(
                bottom: 2,
                left: 20,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          // image: DecorationImage(
                          //   image: NetworkImage(
                          //     "https://image.tmdb.org/t/p/original/" +
                          //         movies[index].poster,
                          //   ),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "https://image.tmdb.org/t/p/original/" +
                              movies[index].poster,
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey[800].withOpacity(1.0),
                                  Style.Colors.primaryColor.withOpacity(0.1),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [
                                  0.0,
                                  0.5,
                                ],
                              ),
                            ),
                            child: Icon(
                              Icons.photo_album,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        //  Image.network(
                        //   "https://image.tmdb.org/t/p/original/" +
                        //       movies[index].poster,
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                status,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  letterSpacing: 4,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movies[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
