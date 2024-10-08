import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:unearthed/models/renter.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  Renter? _userFromFirebaseUser(User? user) {
    return user != null ? Renter(id: user.uid,
      email: 'Anon',
      name: 'anon',
      size: 0,
      address: '',
      countryCode: '+66',
      phoneNum: '',
      favourites: [''],
      settings: ['BANGKOK','CM','CM','KG'],
    ) : null;
  }
  // Sign in anon
  Future signInAnon() async {
    try {
      // FirebaseUser user = (await FirebaseAuth.instance.
// signInWithEmailAndPassword(email: email, password: password))
// .user;
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      log("Sign in error: $e");
      return null;
    }
  }

  // Register with email
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      log('User creation error ${e.toString()}');
      return null;
    }

  }

  // Sign in email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      log('User sign in error ${e.toString()}');
      return null;
    }

  }


  // Sign out
}