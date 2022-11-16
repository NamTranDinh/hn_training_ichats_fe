part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final String userId;

  const Authenticated({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UnAuthenticated extends AuthState {
  final String mess;

  const UnAuthenticated({required this.mess});

  @override
  List<Object> get props => [mess];
}
