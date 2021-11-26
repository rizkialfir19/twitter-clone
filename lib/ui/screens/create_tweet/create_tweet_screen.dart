import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/ui.dart';

class CreateTweetScreen extends StatelessWidget {
  const CreateTweetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _tweet;

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Palette.twitterBackgroundDark,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              _sectionHeader(context),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "What's happening?",
                style: FontHelper.h5Bold(
                  color: Palette.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLength: 280,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "What's happening?",
                  hintStyle: FontHelper.h7Regular(
                    color: Palette.greyLighten1,
                  ),
                  helperStyle: FontHelper.h7Regular(
                    color: Palette.twitterPrimary,
                  ),
                ),
                style: FontHelper.h7Regular(
                  color: Palette.twitterPrimary,
                ),
                onChanged: (value) => _tweet = value,
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: FontHelper.h6Regular(
                color: Palette.twitterPrimary,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              debugPrint("---->Create Tweet");
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 7.0,
              ),
              decoration: BoxDecoration(
                color: Palette.twitterPrimary,
                borderRadius: BorderRadius.circular(
                  18.0,
                ),
              ),
              child: Text(
                'Tweet',
                style: FontHelper.h7Bold(
                  color: Palette.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
