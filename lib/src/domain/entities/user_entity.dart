import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String? userName;
  final String? email;
  final String? password;
  final String? avatarUrl;
  final bool? isOnline;
  final String? status;

  const UserEntity({
    this.userId,
    this.userName,
    this.email,
    this.password,
    this.avatarUrl,
    this.isOnline,
    this.status,
  });

  @override
  List<Object?> get props => [
        userId,
        userName,
        email,
        password,
        avatarUrl,
        isOnline,
        status,
      ];
}
