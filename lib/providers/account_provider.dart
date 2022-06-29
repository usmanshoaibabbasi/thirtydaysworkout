

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {

  bool _loading = false;

  bool get loading => _loading;

  void setloading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  /// https://www.youtube.com/watch?v=1k-gITZA9CI&t=917s ///

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser =await googleSignIn.signIn();

    if(googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }
}
