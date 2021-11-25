import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/app_router.dart';
import 'package:twitter_clone/core/bloc/sign_up/sign_up_cubit.dart';

import 'common/common.dart';
import 'core/core.dart';

class App extends StatelessWidget {
  final BaseFirebaseClient firebaseClient;
  final BaseLocalStorageClient localStorageClient;
  final BaseAuthenticationRepository authenticationRepository;

  const App({
    Key? key,
    required this.firebaseClient,
    required this.localStorageClient,
    required this.authenticationRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => firebaseClient,
        ),
        RepositoryProvider(
          create: (context) => localStorageClient,
        ),
        RepositoryProvider(
          create: (context) => authenticationRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppSetupCubit(
              firebaseClient: firebaseClient,
            )..initialize(),
          ),
          BlocProvider(
            create: (context) => AuthenticationDataCubit(
              appSetupCubit: context.read<AppSetupCubit>(),
              firebaseClient: firebaseClient,
              localStorageClient: localStorageClient,
            ),
          ),
          BlocProvider(
            create: (context) => TabCubit(),
          ),
          BlocProvider(
            create: (context) => SignUpCubit(
              localStorageClient: localStorageClient,
              authenticationRepository: authenticationRepository,
            ),
          ),
        ],
        child: const TwitterApp(),
      ),
    );
  }
}

class TwitterApp extends StatefulWidget {
  const TwitterApp({Key? key}) : super(key: key);

  @override
  _TwitterAppState createState() => _TwitterAppState();
}

class _TwitterAppState extends State<TwitterApp> {
  final AppRouter _appRouter = AppRouter();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  DateTime? _lastUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: _appRouter.onGenerateRoute,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationDataCubit, BaseState<TwitterUser>>(
                listener: (context, state) {
                  if (state is AuthenticatedState) {
                    if (_lastUser == null) {
                      _lastUser = state.timestamp;
                      // Trigger Patch Change Tab
                      context.read<TabCubit>().changeTab(tab: AppTab.home);
                      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                        RouteName.landingScreen,
                        (route) => false,
                      );
                    }
                  }

                  if (state is UnauthenticatedState) {
                    _lastUser = null;
                    _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      RouteName.registerScreen,
                      (route) => false,
                    );
                  }
                },
              ),
              // BlocListener<AppSetupCubit, AppSetupState>(
              //   listener: (context, state) {
              //     if (state == AppSetupState.SUCCESS) {
              //       _firebaseMessagingConfig();
              //     }
              //
              //     if (state == AppSetupState.FAILED) {
              //       showDialogError();
              //     }
              //   },
              // ),
            ],
            child: child!,
          ),
        );
      },
    );
  }
}
