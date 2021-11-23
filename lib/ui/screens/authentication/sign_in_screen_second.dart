import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/ui/ui.dart';

class SignInScreenSecond extends StatefulWidget {
  const SignInScreenSecond({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreenSecond> createState() => _SignInScreenSecondState();
}

class _SignInScreenSecondState extends State<SignInScreenSecond> {
  String? argsData;
  String? _password;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments is String) {
      argsData = ModalRoute.of(context)!.settings.arguments as String;
      print("----> argsData: $argsData");
    }

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
                "Enter your password",
                style: FontHelper.h5Bold(
                  color: Palette.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 7.0,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: Palette.greyLighten1,
                    ),
                  ),
                ),
                child: Text(
                  argsData ?? "-",
                  style: FontHelper.h6Bold(
                    color: Palette.greyLighten1,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: FontHelper.h7Regular(
                    color: Palette.greyLighten1,
                  ),
                ),
                style: FontHelper.h7Regular(
                  color: Palette.twitterPrimary,
                ),
                onChanged: (value) => _password = value,
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
                    RouteName.landingScreen,
                  ),
                  child: const ContainerSocialMediaButton(
                    title: 'Log in',
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
