import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http; // utilisé plus tard pour Cloudinary

import '../models/user.dart';

class AuthMethode {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return "Please fill all the fields";
      }

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty || username.isEmpty) {
        return "Please fill all the fields";
      }

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user == null) {
        return "Something went wrong";
      }

      final users = Users(
        uid: user.uid,
        email: email,
        username: username,
        bio: "",
        photoUrl: "",
        followers: [],
        following: [],
        posts: [],
        saved: [],
        searchKey: username.isNotEmpty ? username[0].toLowerCase() : "",
      );

      await _firestore.collection("users").doc(user.uid).set(users.toJson());

      return "success";
    } catch (e) {
      return e.toString();
    }
  }
}
