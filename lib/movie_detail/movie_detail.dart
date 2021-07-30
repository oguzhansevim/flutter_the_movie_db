import 'package:flutter/material.dart';

import 'movie_detail_view.dart';

class MovieDetail extends StatefulWidget {
  final int movieId;

  MovieDetail(this.movieId);

  @override
  MovieDetailView createState() => new MovieDetailView();
}
