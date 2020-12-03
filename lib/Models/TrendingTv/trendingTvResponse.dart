import 'package:moviebox/Models/TrendingTv/trendingTv.dart';

class TrendingTvResponse {
  final List<TrendingTv> trendingtv;
  final String error;

  TrendingTvResponse({this.trendingtv, this.error});

  TrendingTvResponse.fromJson(Map<String, dynamic> json)
      : trendingtv = (json["results"] as List)
            .map((i) => new TrendingTv.fromJson(i))
            .toList(),
        error = "";

  TrendingTvResponse.withError(String errorValue)
      : trendingtv = List(),
        error = errorValue;
}
