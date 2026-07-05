import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<User?> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Stream<User?> checkAuthStatus();

  Future<UserCredential> signInWithCredentials(AuthCredential credential);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signIn(String email, String password) async {
    final UserCredential result = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    final User? user = result.user;
    if (user == null) {
      throw StateError('Firebase sign-in completed without a user.');
    }
    return user.uid;
  }

  @override
  Future<String> signUp(String email, String password) async {
    final UserCredential result = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    final User? user = result.user;
    if (user == null) {
      throw StateError('Firebase sign-up completed without a user.');
    }
    return user.uid;
  }

  @override
  Future<UserCredential> signInWithCredentials(
      AuthCredential credential) async {
    return _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Stream<User?> checkAuthStatus() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<void> sendEmailVerification() async {
    final User? user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    final User? user = _firebaseAuth.currentUser;
    return user?.emailVerified ?? false;
  }
}
