import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/page/Song_screen.dart';
import 'package:spotify_clone/page/Song_screen/Song_screen1.dart';
import 'package:spotify_clone/page/Song_screen/Song_screen2.dart';
import 'package:spotify_clone/page/home.dart';
import 'package:spotify_clone/page/login.dart';
import 'package:spotify_clone/page/login_page.dart';

import 'package:spotify_clone/page/root_app.dart';
import 'package:spotify_clone/page/setting.dart';
import 'package:spotify_clone/page/user_page.dart';
import 'package:spotify_clone/page/register_email.dart';
// import 'package:spotify_clone/page/register_pass.dart';
import 'package:spotify_clone/page/splashScreen.dart';
import 'package:spotify_clone/page/welcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify_clone/provider/google_sign_in.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const RootApp();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }

              return const LoginScreen();
            },
          ),
          // home: const SplashScreen(),
          routes: {
            WelcomeScreen.routeName: (context) => const WelcomeScreen(),
            RegisterPage.routeName: (context) => const RegisterPage(
                  title: 'register',
                ),
            RootApp.routeName: (context) => const RootApp(),
            SongScreen.routeName: (context) => const SongScreen(),
            SongScreen2.routeName: (context) => const SongScreen2(),
            SongScreen1.routeName: (context) => const SongScreen1(),
            LoginPage.routeName: (context) => const LoginPage(title: 'login'),
            UserPage.routeName: (context) => const UserPage(),
            SongScreen1.routeName: (context) => const SongScreen1(),
            SittingScreen.routeName: (context) => const SittingScreen(),
          },
        ));
  }
}
