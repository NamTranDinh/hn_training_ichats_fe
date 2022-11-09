import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_chat/src/data/remote_data_sources/auth_data_src/firebase_remote_data_resources.dart';
import 'package:i_chat/src/data/remote_data_sources/models/user_model.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';

class FirebaseRemoteDataResourceImpl implements FirebaseRemoteDataResources {
  final FirebaseFirestore firebaseFireStore;
  final FirebaseAuth firebaseAuth;

  FirebaseRemoteDataResourceImpl(
      {required this.firebaseFireStore, required this.firebaseAuth});

  @override
  Future<void> forgotPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity userEntity) async {
    /// 'users' is collection name into cloud_fireStore
    final userCollection = firebaseFireStore.collection('users');
    final userId = await getCurrentUserId();
    userCollection.doc(userId).get().then((userDoc) {
      final newUser = UserModel(
        userId: userEntity.userId,
        userName: userEntity.userName,
        email: userEntity.email,
        password: userEntity.password,
        avatarUrl: userEntity.avatarUrl,
        isOnline: userEntity.isOnline,
        status: userEntity.status,
      ).toDocument();
      if (!userDoc.exists) {
        userCollection.doc(userId).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUserId() async {
    return firebaseAuth.currentUser!.uid;
  }

  @override
  Future<void> getUpdateUser(UserEntity userEntity) async {
    // TODO: implement getUpdateUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async {
    return firebaseAuth.currentUser?.uid != null;
  }

  @override
  Future<void> signIn(UserEntity userEntity) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: userEntity.email!, password: userEntity.password!);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> signUp(UserEntity userEntity) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: userEntity.email!, password: userEntity.password!);
  }
}
