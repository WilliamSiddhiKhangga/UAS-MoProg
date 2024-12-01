import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // sign in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential createUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return createUser;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    return await auth.signOut();
  }

  // Function to make a new user account in cloud firestore
  Future<void> createUserInFirestore(User user) async {
    try {
      final userDoc = firestore.collection('Users').doc(user.uid);

      if ((await userDoc.get()).exists == false) {
        await userDoc.set({
          'Name': user.displayName ?? 'User Name',
          'Email': user.email ?? '',
          'Phone': '',
          'CreatedAt': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      throw Exception('Failed to create user in Firestore: $e');
    }
  }

  // Google Sign in
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await auth.signInWithCredential(authCredential);
    } catch (e) {
      print("Google sign in failed: ");
      return null;
    }
  }
}
