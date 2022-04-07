import 'package:ecomarceapp/utils/my_string.dart';
import 'package:ecomarceapp/utils/route/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FireAuth{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static bool isSignedIn = false;
  static final GetStorage authBox = GetStorage();

  static Future<User?> registerUsingEmailPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {

    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      isSignedIn = true;
      authBox.write(authValue, isSignedIn);
      print(isSignedIn);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        _showErrorDialog("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        _showErrorDialog("Wrong password provided.", context);
      }
    }

    return user;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);
        isSignedIn = true;
        authBox.write(authValue, isSignedIn);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          _showErrorDialog(
              "The account already exists with a different credential.",
              context);
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          _showErrorDialog(
              "Error occurred while accessing credentials. Try again", context);
        }
      } catch (e) {
        // handle the error here
        _showErrorDialog(
            "Error occurred using Google Sign-In. Try again.", context);
      }
    }

    return user;
  }

  static Future<void> signOutGoogle({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
      Get.offNamed(Routes.welcomeScreen);
      isSignedIn = false;
      authBox.remove(authValue);
    } catch (e) {
      _showErrorDialog("Error signing out. Try again.", context);
    }
  }

  static void _showErrorDialog(msg, context) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('wrong'),
          content: Text(msg),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ));
  }



}