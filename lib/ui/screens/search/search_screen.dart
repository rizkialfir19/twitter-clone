import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/ui.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Palette.greyLighten1,
            ),
          ),
          color: Palette.twitterBackgroundDark,
        ),
        child: const Center(
          child: Text(
            'Search Screen',
            style: TextStyle(
              color: Palette.white,
            ),
          ),
        ),
      ),
    );
  }
}
