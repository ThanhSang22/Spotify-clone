import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/models/user.dart' as model;
import 'package:flutter/material.dart';


class AuthMethods extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async{
    User currenUser = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('users').doc(currenUser.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty
          ) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.User user = model.User(
            username: username,
            uid: cred.user!.uid,
            email: email,
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

        // await _firestore.collection('users').add({
        //
        // });

        res = 'success';
      }
      ;
    } catch (err) {
      res = err.toString();
    }
    return res;
  }



  Future<String> loginUser({
    required String email,
    required String password
  }) async {
    String res = "Some error occurred";

    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = 'success';
      }else{
        res = 'Please enter all the fields';
      }
    }catch(err){
      res = err.toString();
    }
    return res;
  }
}