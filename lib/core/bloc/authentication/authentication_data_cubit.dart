import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/common/common.dart';

import '../../core.dart';

part 'authentication_state.dart';

class AuthenticationDataCubit extends Cubit<BaseState<TwitterUser>> {
  final AppSetupCubit appSetupCubit;

  late StreamSubscription appSetupCubitSubs;

  AuthenticationDataCubit({
    required this.appSetupCubit,
  }) : super(InitializedState()) {
    appSetupCubitSubs = appSetupCubit.stream.listen((state) {
      if (state == AppSetupState.success) {
        initialize();
      }
    });
  }

  @override
  Future<void> close() {
    appSetupCubitSubs.cancel();
    return super.close();
  }

  void initialize() async {
    String? _token;
    String? _rawUserData;
    TwitterUser? _twitterUserData;

    /// Get & Check Local Token
    try {
      ///TODO: Get Bearer Token
      // _token = await localStorageClient.getByKey(
      //   SharedPrefKeys.JWT_TOKEN,
      //   SharedPrefType.STRING,
      // );

      print('[$this - getJWTToken] - Result : $_token');

      if (_token == null) {
        emit(UnauthenticatedState());
        return;
      }
    } catch (e) {
      emit(UnauthenticatedState());
      return;
    }

    /// Check & Validate Expired JWT Token
    try {
      // bool isExpired = transformers.isTokenExpired(_token);

      // if (isExpired) {
      emit(UnauthenticatedState());
      // return;
      // }
    } catch (e) {
      emit(UnauthenticatedState());
      return;
    }

    /// Get & Check Local Raw User Data
    /// TODO: Get Yummy User login data
    // try {
    //   _rawUserData = await localStorageClient.getByKey(
    //     SharedPrefKeys.USER_DATA,
    //     SharedPrefType.STRING,
    //   );
    //
    //   if (_rawUserData == null) {
    //     throw Exception('Raw User Null');
    //   }
    // } catch (e) {
    //   emit(UnauthenticatedState());
    //   Logger().write(
    //     tag: 'INFO',
    //     className: this,
    //     functionName: 'initialize',
    //     message: 'Error while Get & Check Local Data',
    //     exception: e,
    //     sendCrashlytics: true,
    //   );
    //   return;
    // }

    /// Parse Raw User Data To Model
    /// /// TODO: Parse Yummy User login data
    // try {
    //   _yummyUserData = UserData.fromJson(jsonDecode(_rawUserData));
    // } catch (e) {
    //   emit(UnauthenticatedState());
    //   Logger().write(
    //     tag: 'INFO',
    //     className: this,
    //     functionName: 'initialize',
    //     message: 'Error while Parse Raw User Data To Model',
    //     exception: e,
    //     sendCrashlytics: true,
    //   );
    //   return;
    // }

    /// All Passed
    emit(
      AuthenticatedState(
        data: _twitterUserData,
        timestamp: DateTime.now(),
      ),
    );
  }
}
