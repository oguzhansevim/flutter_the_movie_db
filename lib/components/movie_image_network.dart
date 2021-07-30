import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MovieImageNetwork extends StatelessWidget {
  final String imagePath;
  final BuildContext context;
  final String type;

  const MovieImageNetwork(this.imagePath, this.context, this.type);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      Constants.API_IMAGE_URL + imagePath,
      width: MediaQuery.of(context).size.width * (type == 'list' ? 0.25 : 0.5 ),
    );
  }
}
