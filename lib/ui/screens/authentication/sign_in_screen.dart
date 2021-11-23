import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/ui/ui.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _auth;

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
                "To get started, first enter your phone, email, or @username",
                style: FontHelper.h5Bold(
                  color: Palette.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Phone, email, or username',
                  hintStyle: FontHelper.h7Regular(
                    color: Palette.greyLighten1,
                  ),
                ),
                style: FontHelper.h7Regular(
                  color: Palette.twitterPrimary,
                ),
                onChanged: (value) => _auth = value,
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteName.signInScreenSecond,
                    arguments: ScreenArgument(
                      data: _auth,
                    ),
                  ),
                  child: const ContainerSocialMediaButton(
                    title: 'Next',
                    titleColor: Palette.white,
                    color: Palette.twitterPrimary,
                    useIcon: false,
                  ),
                ),
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
    );
  }
}
