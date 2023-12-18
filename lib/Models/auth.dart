import'package:firebase_auth/firebase_auth.dart';

class Auth{

  final FirebaseAuth _firebaseAuth =  FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  
    Future<void> signinMitEmailPass({required String email, required String password}) async{
      try{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
   catch(error){
    rethrow;
   }
   }
  Future<void> createMitEmailPass({required String email, required String password}) async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
  Future <void> signout() async{
    _firebaseAuth.signOut();
  }
} 