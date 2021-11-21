import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/app_router.dart';

import 'common/common.dart';
import 'core/core.dart';

class App extends StatelessWidget {
  // final BaseApiClient apiClient;
  final BaseFirebaseClient firebaseClient;
  // final BaseLocalStorageClient localStorageClient;
  // final BaseExampleRepository exampleRepository;

  const App({
    Key? key,
    // required this.apiClient,
    required this.firebaseClient,
    // required this.localStorageClient,
    // required this.exampleRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider(
        //   create: (context) => apiClient,
        // ),
        RepositoryProvider(
          create: (context) => firebaseClient,
        ),
        // RepositoryProvider(
        //   create: (context) => localStorageClient,
        // ),
        // RepositoryProvider(
        //   create: (context) => exampleRepository,
        // ),
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
            ),
          ),
          BlocProvider(
            create: (context) => TabCubit(),
          ),
          // BlocProvider(
          //   create: (context) => ExampleCubit(
          //     localStorageClient: localStorageClient,
          //     exampleRepository: exampleRepository,
          //   ),
          // ),
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
              // BlocListener<AuthenticationActionCubit, BaseState>(
              //   listener: (context, state) {
              //     if (state is SuccessState) {
              //       if (state.data is bool) {
              //         bool isExpired = state.data;
              //         if (isExpired) {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             SnackBar(
              //               backgroundColor: Palette.redLighten1,
              //               content: Text(
              //                 'Sesi Login Kamu Berakhir\n'
              //                 'Silahkan melakukan login kembali untuk masuk ke aplikasi S-Rangers',
              //                 style: FontHelper.h8Regular(
              //                   color: Palette.white,
              //                 ),
              //               ),
              //               behavior: SnackBarBehavior.floating,
              //               duration: Duration(seconds: 5),
              //             ),
              //           );
              //         }
              //         context.read<AuthenticationDataCubit>().initialize();
              //       }
              //
              //       if (state.data is UserData) {
              //         context.read<AuthenticationDataCubit>().updateData(
              //               userData: state.data,
              //             );
              //       } else {
              //         context.read<VersionCubit>().getLatest();
              //       }
              //     }
              //     if (state is ErrorState) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           backgroundColor: Palette.redLighten1,
              //           content: Text(
              //             'Terjadi Kesalahan, Silakan Coba Lagi.',
              //             style: FontHelper.h8Regular(
              //               color: Palette.white,
              //             ),
              //           ),
              //           behavior: SnackBarBehavior.floating,
              //           duration: Duration(seconds: 3),
              //         ),
              //       );
              //     }
              //   },
              // ),
              BlocListener<AuthenticationDataCubit, BaseState<TwitterUser>>(
                listener: (context, state) {
                  print('----> masuk listener');
                  print('----> masuk authDataCubit');
                  print('----> masuk state: $state');
                  if (state is AuthenticatedState) {
                    if (_lastUser == null) {
                      _lastUser = state.timestamp;
                      // Trigger Patch Change Tab
                      context.read<TabCubit>().changeTab(tab: AppTab.home);
                      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                        RouteName.landingScreen,
                        (route) => false,
                      );

                      ///TODO: Not need checkNotif
                      //
                      // // Always Check Last Seen Notification on First Run App
                      // context.read<GlobalNotifierCubit>().checkNotification(
                      //       globalNotificationType:
                      //           GlobalNotificationType.NOTIFICATION_LIFECYCLE,
                      //       userData: state.data,
                      //     );
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
