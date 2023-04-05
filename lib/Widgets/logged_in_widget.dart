
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class LognInWidget extends StatelessWidget {

 User? user = FirebaseAuth.instance.currentUser;

  LognInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logn In'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
            }, child: const Text('Lognout'))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        child: Column(
          children: [
            const Text('Profile',
            style: TextStyle(fontSize: 24),),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user?.photoURL.toString() ?? ''),
            ),
            Text(user?.displayName.toString() ?? ''),
            Text(user?.email.toString() ?? ''),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
