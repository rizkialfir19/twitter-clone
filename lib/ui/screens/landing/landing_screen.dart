import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/ui/ui.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, AppTab>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Palette.transparent,
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Palette.twitterBackgroundDark,
            selectedItemColor: Palette.twitterPrimary,
            unselectedItemColor: Palette.grey,
            selectedLabelStyle: FontHelper.h9Regular(
              color: Palette.twitterPrimary,
            ),
            unselectedLabelStyle: FontHelper.h9Regular(
              color: Palette.grey,
            ),
            showUnselectedLabels: true,
            onTap: (index) => context.read<TabCubit>().changeTab(
                  tab: AppTab.values[index],
                ),
            currentIndex: AppTab.values.indexOf(state),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.home_outlined,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.home_filled,
                      color: Palette.twitterPrimary,
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.search,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.search,
                      color: Palette.twitterPrimary,
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.ac_unit,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.ac_unit,
                      color: Palette.twitterPrimary,
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.notifications_none_outlined,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.notifications,
                      color: Palette.twitterPrimary,
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.mail_outline,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.mail,
                      color: Palette.twitterPrimary,
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
          body: _buildContent(state),
        );
      },
    );
  }

  Widget _buildContent(AppTab state) {
    if (state == AppTab.home) {
      return const SafeArea(
        child: HomeScreen(),
      );
    }
    if (state == AppTab.search) {
      return const SafeArea(
        child: SearchScreen(),
      );
    }
    if (state == AppTab.spaces) {
      return const SafeArea(
        child: SpacesScreen(),
      );
    }
    if (state == AppTab.notification) {
      return const SafeArea(
        child: NotificationScreen(),
      );
    }
    if (state == AppTab.message) {
      return const SafeArea(
        child: MessageScreen(),
      );
    }
    return Container();
  }
}
