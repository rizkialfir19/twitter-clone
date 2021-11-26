import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/ui/screens/profile/profile_screen.dart';

import 'common/common.dart';
import 'ui/ui.dart';

class AppRouter {
  /// Delegates for screen routing
  Route onGenerateRoute(RouteSettings routeSettings) {
    final ScreenArgument? args = routeSettings.arguments != null
        ? routeSettings.arguments as ScreenArgument
        : null;

    switch (routeSettings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.splashScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SplashScreen(),
                )
              : const SplashScreen(),
        );

      case RouteName.registerScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.registerScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const RegisterScreen(),
                )
              : const RegisterScreen(),
        );

      case RouteName.createAccountScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.createAccountScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const CreateAccountScreen(),
                )
              : const CreateAccountScreen(),
        );

      case RouteName.signInScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.signInScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SignInScreen(),
                )
              : const SignInScreen(),
        );

      case RouteName.signInScreenSecond:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.signInScreenSecond,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SignInScreenSecond(),
                )
              : const SignInScreenSecond(),
        );

      case RouteName.landingScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.landingScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const LandingScreen(),
                )
              : const LandingScreen(),
        );

      case RouteName.homeScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.homeScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const HomeScreen(),
                )
              : const HomeScreen(),
        );

      case RouteName.searchScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.searchScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SearchScreen(),
                )
              : const SearchScreen(),
        );

      case RouteName.spacesScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.spacesScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SpacesScreen(),
                )
              : const SpacesScreen(),
        );

      case RouteName.notificationScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.notificationScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const NotificationScreen(),
                )
              : const NotificationScreen(),
        );

      case RouteName.messageScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.messageScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const MessageScreen(),
                )
              : const MessageScreen(),
        );

      case RouteName.createTweetScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.createTweetScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const CreateTweetScreen(),
                )
              : const CreateTweetScreen(),
        );

      case RouteName.profileScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.profileScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const ProfileScreen(),
                )
              : const ProfileScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
