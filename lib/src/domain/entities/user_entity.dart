import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String? userName;
  final String? email;
  final String? password;

  const UserEntity({
    this.userId,
    this.userName,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [
        userId,
        userName,
        email,
        password,
      ];
}
