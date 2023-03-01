import 'dart:io';

import 'package:am_proiect/models/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthApi {
  const AuthApi({required FirebaseAuth auth, required FirebaseFirestore firestore, required FirebaseStorage storage})
      : _auth = auth,
        _firestore = firestore,
        _storage = storage;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  Future<AppUser> login(String email, String password) async {
    UserCredential result;
    final DocumentSnapshot<Map<String, dynamic>> snapshot;

    final AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
    result = await _auth.signInWithCredential(credential);
    snapshot = await _firestore //
        .doc('users/${result.user!.uid}')
        .get();

    return AppUser.fromJson(snapshot.data());
  }

  Future<AppUser> register(String email, String password, String fullName, String phoneNumber) async {
    final UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    final AppUser user = AppUser((AppUserBuilder b) {
      b
        ..uid = result.user!.uid
        ..email = email
        ..fullName = fullName
        ..phoneNumber = phoneNumber;
    });

    await _firestore //
        .doc('users/${user.uid}')
        .set(user.json);
    return user;
  }

  Future<AppUser?> getCurrentUser() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      return null;
    }

    final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore //
        .doc('users/${user.uid}')
        .get();

    return AppUser.fromJson(snapshot.data());
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> resetPassword(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> verifyEmail() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<String> addPhotoEdited(String uid, String path) async {
    // 1. upload file
    await _storage //
        .ref('users/$uid/profile.png')
        .putFile(File(path));
    // 2.get url
    final String url = await _storage //
        .ref('users/$uid/profile.png')
        .getDownloadURL();

    // 3. update user profile
    _firestore //
        .doc('users/$uid')
        .update(<String, dynamic>{'photoUrl': url});

    return url;
  }





  Future<void> deleteProfileUrl(String uid) async {
    await _storage //
        .ref('users/$uid/profile.png')
        .delete();
    _firestore //

        .doc('users/$uid')
        .update(<String, dynamic>{'photoUrl': ''});
  }
}
