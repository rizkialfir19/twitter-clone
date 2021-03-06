import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/ui/ui.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _fullName, _email, _username, _password;

    return Scaffold(
      body: BlocConsumer<SignUpCubit, BaseState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Congratulations, you can sign in now",
                ),
              ),
            );
          }

          if (state is ErrorState) {
            if (state.error.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Something went wrong, try again later",
                  ),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return Container(
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
                    "Create your account",
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
                      hintText: 'Email',
                      hintStyle: FontHelper.h7Regular(
                        color: Palette.greyLighten1,
                      ),
                    ),
                    style: FontHelper.h7Regular(
                      color: Palette.twitterPrimary,
                    ),
                    onChanged: (value) => _email = value,
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: FontHelper.h7Regular(
                        color: Palette.greyLighten1,
                      ),
                    ),
                    style: FontHelper.h7Regular(
                      color: Palette.twitterPrimary,
                    ),
                    onChanged: (value) => _username = value,
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: FontHelper.h7Regular(
                        color: Palette.greyLighten1,
                      ),
                    ),
                    style: FontHelper.h7Regular(
                      color: Palette.twitterPrimary,
                    ),
                    onChanged: (value) => _fullName = value,
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
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
                  const SizedBox(
                    height: 100.0,
                  ),
                  if (state is LoadingState) ...[
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ] else ...[
                    GestureDetector(
                      onTap: () {
                        if (_email != null &&
                            _username != null &&
                            _fullName != null &&
                            _password != null) {
                          FocusScope.of(context).unfocus();

                          context.read<SignUpCubit>().signUpAccount(
                                email: _email!,
                                username: _username!,
                                fullName: _fullName!,
                                password: _password!,
                              );
                        }
                      },
                      child: const ContainerSocialMediaButton(
                        title: 'Sign Up',
                        titleColor: Palette.white,
                        color: Palette.twitterPrimary,
                        useIcon: false,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
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
                color: Palette.white,
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
