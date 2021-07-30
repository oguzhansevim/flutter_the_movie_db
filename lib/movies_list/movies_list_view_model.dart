import 'dart:convert';

import 'package:flutter/material.dart';
import '../movie_detail/movie_detail.dart';
import '../constants/constants.dart';
import 'model/movies_model.dart';
import 'movies_list.dart';
import 'package:http/http.dart' as http;

abstract class MoviesListViewModel extends State<MoviesList> {
  late List<MoviesModel> moviesList = [];

  @override
  void initState() {
    super.initState();
    _upcomingMovies();
  }

  /// Set the fetched data to variable
  void _upcomingMovies() async {
    final movies = await _fetchUpcomingMovies();

    /// Set state when the data available and refresh the view with data
    setState(() {
      print('set state');
      moviesList = movies;
    });
  }

  /// Fetching movies data with `HTTP`plugin
  Future<List<MoviesModel>> _fetchUpcomingMovies() async {
    Uri url = Uri.parse(Constants.API_URL);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => MoviesModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetching data from API');
    }
  }

  navigateToDetail(int? id) {
    if (id == null) {
      throw Exception('There is no id for this movie, id parameter is required for detail page');
    } else {
      print(id);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MovieDetail(id),
        ),
      );
    }
  }
}
