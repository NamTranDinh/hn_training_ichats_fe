import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? userId,
    final String? userName,
    final String? email,
    final String? password,
  }) : super(
          userId: userId,
          userName: userName,
          email: email,
          password: password,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      userId: snapshot.get('userId'),
      userName: snapshot.get('userName'),
      email: snapshot.get('email'),
      password: snapshot.get('password'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'password': password,
    };
  }
}
