import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepo {
   static Future<User?> login(String email,String password) async {
    final FirebaseAuth auth=FirebaseAuth.instance;
    try {
      UserCredential credential =await auth.signInWithEmailAndPassword(email: email, password: password);
      print(credential);
      return credential.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

    static Future<UserCredential?> loginwithgoogle()async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential credentials =
            await FirebaseAuth.instance.signInWithCredential(credential);
            return credentials;
      }
    } catch (e) {
      return null;
    }
  }
}