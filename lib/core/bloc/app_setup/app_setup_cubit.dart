import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/core/core.dart';

class AppSetupCubit extends Cubit<AppSetupState> {
  final BaseFirebaseClient firebaseClient;

  AppSetupCubit({
    required this.firebaseClient,
  }) : super(AppSetupState.uninitialized);

  /// Initialize all setups that required by the application
  void initialize() async {
    print("---> Masuk initialize AppSetupCubit");
    try {
      // await firebaseClient.initializeApp();

      // firebaseClient.crashlyticsListenError();
      // await firebaseClient.remoteConfigSetting(
      //   Duration(seconds: 10),
      //   Duration(seconds: 60),
      // );
      // await firebaseClient.remoteConfigFetch();
      // await firebaseClient.requestPermission(
      //   sound: true,
      //   badge: true,
      //   alert: true,
      //   provisional: true,
      // );

      await Future.delayed(Duration(seconds: 2));

      print("---> Masuk success AppSetupCubit");

      emit(AppSetupState.success);
    } catch (e, s) {
      print("---> Masuk failed AppSetupCubit");
      print("---> e: $e");
      print("---> s: $s");
      emit(AppSetupState.failed);
      // Logger().write(
      //   tag: 'INFO',
      //   className: this,
      //   functionName: 'initialize',
      //   message: 'Error while initialize firebase',
      //   exception: e,
      // );
    }
  }
}
