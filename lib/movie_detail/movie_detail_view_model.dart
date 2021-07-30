import 'dart:convert';

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'model/movie_detail_model.dart';
import 'movie_detail.dart';
import 'package:http/http.dart' as http;

abstract class MovieDetailViewModel extends State<MovieDetail> {
  late MovieDetailModel movieDetail;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _movieDetail();
  }

  /// Set the fetched data to variable
  void _movieDetail() async {
    final movie = await _fetchMovieDetail();

    /// Set state when the data available and refresh the view with data
    setState(() {
      print('set state');
      loading = false;
      movieDetail = movie;
    });
  }

  /// Fetching movies data with `HTTP`plugin
  Future<MovieDetailModel> _fetchMovieDetail() async {
    Uri url = Uri.parse(Constants.API_DETAIL_URL + widget.movieId.toString() + Constants.API_KEY);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return MovieDetailModel.fromJson(result);
    } else {
      throw Exception('Failed to fetching data from API');
    }
  }
}
