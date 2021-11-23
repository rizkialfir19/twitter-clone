import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/ui/ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.2,
              color: Palette.greyLighten1,
            ),
          ),
          color: Palette.twitterBackgroundDark,
        ),
        child: ListView(
          children: [
            _sectionHeader(context),
            _sectionContent(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            RouteName.createTweetScreen,
          );
        },
        backgroundColor: Palette.twitterPrimary,
        child: const Icon(
          Icons.create_rounded,
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Palette.greyLighten1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 5.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Container(
                color: Palette.greyLighten1,
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.noPhotos,
                  height: 25.0,
                  width: 25.0,
                ),
              ),
            ),
            Image.asset(
              Images.logoTwitterPrimary,
              width: 30.0,
              height: 30.0,
              fit: BoxFit.contain,
            ),
            Text(
              'Cancel',
              style: FontHelper.h6Regular(
                color: Palette.twitterBackgroundDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionContent(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ContainerTweet();
      },
    );
  }
}
