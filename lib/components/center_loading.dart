import 'package:flutter/material.dart';

class CenterLoading extends StatelessWidget {
  const CenterLoading();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
