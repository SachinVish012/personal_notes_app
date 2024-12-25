import 'package:flutter/material.dart';
import 'package:personal_notes/core/constants/color_constants.dart';

class ShowLoader extends StatefulWidget {
  const ShowLoader({super.key});

  @override
  State<ShowLoader> createState() => _ShowLoaderState();
}

class _ShowLoaderState extends State<ShowLoader> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorConstants.white,
      ),
    );
  }
}
