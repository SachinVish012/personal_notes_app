import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:personal_notes/core/routes/app_routes.dart';
import 'package:personal_notes/core/routes/routes.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _auth = LocalAuthentication();
  AuthBloc() : super(AuthState.init()) {
    on<RequestBioMetricEvent>(_requestBioMetricEvent);
  }
  _requestBioMetricEvent(
    RequestBioMetricEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final isAvailable = await _auth.canCheckBiometrics;
      final isDeviceSupported = await _auth.isDeviceSupported();
      emit(state.copyWith(isBioMetricAvailable: isAvailable));
      if (isDeviceSupported && isAvailable) {
        bool isAuthenticated = await _auth.authenticate(
          localizedReason: 'Please authenticate to access this feature',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
        emit(state.copyWith(isBioMetricAvailable: isAuthenticated));
        if (isAuthenticated) {
          navigatorKey.currentContext!.go(Routes.home);
        }
      }else{
        //----we can send message to user or we can request for other. For now I am redirecting to home.
        navigatorKey.currentContext!.go(Routes.home);
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
