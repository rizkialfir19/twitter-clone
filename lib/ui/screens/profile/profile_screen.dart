import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/core/bloc/bloc.dart';
import 'package:twitter_clone/ui/ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, BaseState>(
        listener: (context, state) {
          if (state is UnauthenticatedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Congratulations, successfully sign out",
                ),
              ),
            );

            Navigator.pushNamed(
              context,
              RouteName.registerScreen,
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
            height: double.maxFinite,
            color: Palette.twitterBackgroundDark,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  _sectionHeader(context),
                  const SizedBox(
                    height: 400.0,
                  ),
                  if (state is LoadingState) ...[
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ] else ...[
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.twitterPrimary,
                          borderRadius: BorderRadius.circular(
                            18.0,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () => context.read<SignUpCubit>().signOut(),
                          child: Text(
                            'Sign Out',
                            style: FontHelper.h5Bold(
                              color: Palette.white,
                            ),
                          ),
                        ),
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
