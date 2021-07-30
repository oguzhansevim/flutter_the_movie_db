import 'package:flutter/material.dart';
import '../components/auto_sized_text.dart';
import '../components/center_loading.dart';
import '../components/movie_image_network.dart';
import '../constants/constants.dart';
import 'movie_detail_view_model.dart';

class MovieDetailView extends MovieDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizedText(
          text: loading ? Constants.LOADING : movieDetail.title.toString(),
        ),
      ),
      body: loading
          ? CenterLoading()
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Card(
                  child: movieDetailColumn(context),
                ),
              ),
            ),
    );
  }

  Column movieDetailColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MovieImageNetwork(movieDetail.posterPath.toString(), context, 'detail'),
        AutoSizedText(
          text: movieDetail.title.toString(),
          style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
        ),
        AutoSizedText(text: movieDetail.overview.toString()),
        rowTwoText(movieDetail.status.toString(), movieDetail.releaseDate.toString()),
        rowTwoText(Constants.POPULARITY, movieDetail.popularity.toString()),
        rowTwoText(Constants.VOTE_AVERAGE, movieDetail.voteAverage.toString()),
        rowTwoText(Constants.VOTE_COUNT, movieDetail.voteCount.toString()),
        AutoSizedText(text: movieDetail.homePage.toString()),
      ],
    );
  }

  Row rowTwoText(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizedText(text: left),
        SizedBox(width: 10.0),
        AutoSizedText(text: right),
      ],
    );
  }
}
