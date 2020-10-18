//Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Google SignIn
import 'package:google_sign_in/google_sign_in.dart';

import 'package:apple_sign_in/apple_sign_in.dart';

//Dart
import 'dart:async';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //Firebase user one-time fetch
  User get getUser => _auth.currentUser;

  //Firebase user real time fetch
  Stream<User> get user => _auth.authStateChanges();

  //Determine if Apple Sign In is available on device
  Future<bool> get appleSignInAvailable => AppleSignIn.isAvailable();

  //Anon Login
  Future<UserCredential> anonLogin() async {
    UserCredential user = await _auth.signInAnonymously();
    updateUserData(user.user);
    return user;
  }

  //Apple Login
  Future<User> appleSignIn() async {
    try {
      final AuthorizationResult appleResult =
          await AppleSignIn.performRequests([
        AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
      ]);
      if (appleResult.error != null) {
        //Handle errors from apple.
        print('Apple Sign In Error: ');
        print(appleResult.error);
      }

      final AuthCredential credential = OAuthProvider('apple.com').credential(
          accessToken:
              String.fromCharCodes(appleResult.credential.authorizationCode),
          idToken: String.fromCharCodes(appleResult.credential.identityToken));
      UserCredential result = await _auth.signInWithCredential(credential);

      User user = result.user;

      updateUserData(user);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Google Login
  Future<User> googleSignIn() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential result = await _auth.signInWithCredential(credential);

      User user = result.user;
      updateUserData(user);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> updateUserData(User user) {
    DocumentReference reportRef = _db.collection('reports').doc(user.uid);

    return reportRef.set(
      {
        'uid': user.uid,
        'lastActivity': DateTime.now(),
      },
      SetOptions(
        merge: true,
      ),
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}
