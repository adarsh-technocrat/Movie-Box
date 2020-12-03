import 'package:flutter/material.dart';
import 'package:moviebox/widgets/carouselWidget.dart';
import 'package:moviebox/bloc/get_tv_OnAir_bloc.dart';
import 'package:moviebox/Models/tv_Response.dart';
import 'package:moviebox/Models/tv_Model.dart';

class NowplayingtvOnAir extends StatefulWidget {
  @override
  _NowplayingtvOnAirState createState() => _NowplayingtvOnAirState();
}

class _NowplayingtvOnAirState extends State<NowplayingtvOnAir> {
  @override
  void initState() {
    tvTodatOnAir..getTvOnAitTodat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TvResponse>(
      stream: tvTodatOnAir.subject.stream,
      builder: (context, AsyncSnapshot<TvResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildNowPlaying(snapshot.data);
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

  int index = 0;
  Widget _buildNowPlaying(TvResponse data) {
    List<Tv> todayonairTv = data.todayonAirtv;
    if (todayonairTv.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("No Movies")],
        ),
      );
    } else {
      return CorouselWidget(
        movies: todayonairTv,
        status: "AIRING TODAY",
      );
    }
  }
}
