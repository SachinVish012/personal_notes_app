part of 'auth_bloc.dart';

class AuthState {
  final bool isLoading;
  final bool isBioMetricVerified;
  final bool isBioMetricAvailable;
  AuthState({
    required this.isLoading,
    required this.isBioMetricVerified,
    required this.isBioMetricAvailable,
  });
  factory AuthState.init() => AuthState(
        isBioMetricVerified: false,
        isBioMetricAvailable: false,
        isLoading: false,
      );
  AuthState copyWith({
    bool? isBioMetricVerified,
    bool? isBioMetricAvailable,
    bool? isLoading,
  }) =>
      AuthState(
        isBioMetricVerified: isBioMetricVerified ?? this.isBioMetricVerified,
        isBioMetricAvailable: isBioMetricAvailable ?? this.isBioMetricAvailable,
        isLoading: isLoading ?? this.isLoading,
      );
}
