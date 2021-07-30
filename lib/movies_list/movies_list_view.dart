import 'package:flutter/material.dart';
import '../components/movie_image_network.dart';
import '../components/auto_sized_text.dart';
import '../components/center_loading.dart';
import '../constants/constants.dart';
import 'movies_list_view_model.dart';
import 'model/movies_model.dart';

class MoviesListView extends MoviesListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.MOVIES_TITLE),
      ),
      body: moviesList.length > 0 ? movieListView() : CenterLoading(),
    );
  }

  ListView movieListView() {
    return ListView.builder(
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        final movie = moviesList[index];
        return GestureDetector(
          onTap: () => navigateToDetail(movie.id),
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieImageNetwork(movie.posterPath.toString(), context, 'list'),
                SizedBox(width: 10.0),
                movieTitleOverviewExpandedColumn(movie, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded movieTitleOverviewExpandedColumn(MoviesModel movie, BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizedText(
            text: movie.title.toString(),
            style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
          ),
          AutoSizedText(text: movie.overview.toString())
        ],
      ),
    );
  }
}
