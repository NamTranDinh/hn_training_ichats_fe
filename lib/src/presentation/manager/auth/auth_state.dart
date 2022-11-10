part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthState {
  final String userId;

  const AuthenticatedState({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UnAuthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}
