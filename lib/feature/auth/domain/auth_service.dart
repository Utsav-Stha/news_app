import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  // AuthService({this.email,this.password});
  // final String? email;
  // final String? password;
  final  FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonymously
  Future<User?> signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  Future signInWithEmail(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future<User?> registerWithEmail(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}