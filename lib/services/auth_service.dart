// import 'dart:html';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService{
//   SignInWithGoogle() async{
//     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication gAuth = await gUser!.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: gAuth.accessToken,
//       idToken: gAuth.idToken,
//     );

//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }

// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizlet_flashcard/services/firestore_service.dart';
import 'package:quizlet_flashcard/utils/firestore_url.dart';

final FirestoreService firestoreService = FirestoreService();

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> googleSignUp() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(authCredential);
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(defaultAvatarURL);
      await firestoreService.createUserDB();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        // Kiểm tra tính hợp lệ của người dùng và trả về
        if (user != null) {
          assert(!user.isAnonymous);
          assert(await user.getIdToken() != null);

          final User? currentUser = _auth.currentUser;
          assert(user.uid == currentUser!.uid);

          return user;
        }
      }
    } 
    catch (e) {
      print("Đã xảy ra lỗi khi đăng nhập bằng Google: $e");
    }
    return null;
  }


  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Signed Out");
  }

  Future<String> emailSignup(String name, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(defaultAvatarURL);
      await firestoreService.createUserDB();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'weak-password'; //The password provided is too weak
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use'; // The account already exists for that email
      }
    } catch (e) {
      print(e);
    }
    return '';
  }

  Future<String> emailSignin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'user-not-found'; // User with that email doesn't exist
      } else if (e.code == 'wrong-password') {
        return 'wrong-password'; // The password is invalid
      }
    }
    return '';
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> forgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return '';
  }
}
