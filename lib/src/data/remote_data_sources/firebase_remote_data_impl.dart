import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_chat/src/data/remote_data_sources/auth_data_src/firebase_remote_data_src.dart';
import 'package:i_chat/src/data/remote_data_sources/models/user_model.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// this is class handle interact with firebase
class FirebaseRemoteDataImpl implements FirebaseRemoteDataSrc {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;

  FirebaseRemoteDataImpl({required this.fireStore, required this.firebaseAuth});

  @override
  Future<void> signInWithAuth(UserEntity userEntity) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: userEntity.email!, password: userEntity.password!);
  }

  @override
  Future<void> signUpWithAuth(UserEntity userEntity) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: userEntity.email!, password: userEntity.password!);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<String> getIdUserCurrent() async {
    return firebaseAuth.currentUser!.uid;
  }

  @override
  Future<bool> isSignedIn() async {
    return firebaseAuth.currentUser!.uid != null;
  }

  @override
  Future<void> saveInfoCurrentUser(UserEntity userEntity) async {
    final userCollection = fireStore.collection('users');
    final userId = await getIdUserCurrent();
    userCollection.doc(userId).get().then((userDoc) {
      final newUser = UserModel(
        userId: userId,
        userName: userEntity.userName,
        email: userEntity.email,
        password: userEntity.password,
      ).toDocument();
      if (!userDoc.exists) {
        userCollection.doc(userId).set(newUser);
      }
      return;
    });
  }
}
