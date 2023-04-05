import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotify_clone/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const FlutterLogo(
            size: 30,
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hello my app',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,decoration:TextDecoration.none),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
              onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                provider.googleLogin();
                

              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: const Size(double.infinity,50),
              ),
              icon:const FaIcon(FontAwesomeIcons.google),
              label: const Text('Sign up wwith Google'),
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
              text: const TextSpan(children: [
            TextSpan(
              text: 'Login ',
              style: TextStyle(decoration: TextDecoration.underline),
            )
          ]))
        ],
      ),
    );
  }
}
