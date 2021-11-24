import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/ui/styles/palette.dart';
import 'package:twitter_clone/ui/styles/styles.dart';
import 'package:twitter_clone/ui/ui.dart';
import 'package:twitter_clone/ui/widgets/container/container_social_media_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          color: Palette.twitterBackgroundDark,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Image.asset(
                  Images.logoTwitterPrimary,
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 150.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    "See what's happening\nin the world right now.",
                    style: FontHelper.h4Bold(
                      color: Palette.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 150.0,
                ),
                _sectionSocialMedia(context),
                const SizedBox(
                  height: 10.0,
                ),
                _sectionDivider(context),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteName.createAccountScreen,
                    ),
                    child: const ContainerSocialMediaButton(
                      title: 'Create account',
                      titleColor: Palette.white,
                      color: Palette.twitterPrimary,
                      useIcon: false,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _sectionTermsPolicy(context),
                const SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _sectionLogin(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionSocialMedia(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: const [
          ContainerSocialMediaButton(
            title: 'Continue with Google',
          ),
          SizedBox(
            height: 15.0,
          ),
          ContainerSocialMediaButton(
            title: 'Continue with Apple',
            icon: Icons.mail,
          ),
        ],
      ),
    );
  }

  Widget _sectionDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width / 2.9,
            color: Palette.white,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            "Or",
            style: FontHelper.h7Regular(
              color: Palette.white,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width / 2.9,
            color: Palette.white,
          ),
        ],
      ),
    );
  }

  Widget _sectionTermsPolicy(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By signing up, you agree to our',
              style: FontHelper.h7Regular(
                color: Palette.greyLighten1,
              ),
            ),
            TextSpan(
              text: ' Terms, Privacy, Policy',
              style: FontHelper.h7Regular(
                color: Palette.twitterSecondary,
              ),
            ),
            TextSpan(
              text: ' and',
              style: FontHelper.h7Regular(
                color: Palette.greyLighten1,
              ),
            ),
            TextSpan(
              text: ' Cookies Use.',
              style: FontHelper.h7Regular(
                color: Palette.twitterSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          RouteName.signInScreen,
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Have an account already?',
                style: FontHelper.h6Regular(
                  color: Palette.greyLighten1,
                ),
              ),
              TextSpan(
                text: ' Log in',
                style: FontHelper.h6Regular(
                  color: Palette.twitterSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
