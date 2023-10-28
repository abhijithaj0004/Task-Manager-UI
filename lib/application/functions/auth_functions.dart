import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthFn {
  Future<void> signIn(context, email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.code, style: TextStyle(fontSize: 20)),
        ),
      );
    }
  }
}
