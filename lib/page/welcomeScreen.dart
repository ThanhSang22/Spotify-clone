import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/page/login.dart';
import 'package:spotify_clone/page/login_page.dart';
import 'package:spotify_clone/page/register_email.dart';
import 'package:spotify_clone/page/root_app.dart';
import 'package:spotify_clone/provider/facebook_login.dart';
import 'package:spotify_clone/provider/google_sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = "/welcomeScreen";

  WelcomeScreen createState() => const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(color: const Color(0xff000000)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(children: [
                    Image.asset('assets/images/logo.png',
                        width: 60, height: 60, fit: BoxFit.fill),
                    const SizedBox(height: 30),
                    const SizedBox(
                        width: 300,
                        child: Text(
                          "Hàng triệu bài hát.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                        width: 300,
                        child: Text(
                          "Miễn phí trên Spotify.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                            RegisterPage.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        // side: BorderSide(width: 2, color: Colors.white),
                        primary: Colors.green,
                        minimumSize: const Size(350, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Đăng kí miễn phí',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        // backgroundColor: Colors.white,// background
                        // primary: Colors.orange, // foreground text
                        minimumSize: const Size(350, 50),
                        side: const BorderSide(
                            color: Colors.grey), // foreground border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const Icon(
                        Icons.phone_android_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                      label: const Text('Tiếp tục với số điện thoại',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        final provider =
                            Provider.of<GoogleSignInProvider>(context, listen:false);
                        provider.googleLogin();
                        Navigator.of(context)
                            .pushReplacementNamed(RootApp.routeName);
                      },
                      style: OutlinedButton.styleFrom(
                        // backgroundColor: Colors.white,// background
                        // primary: Colors.orange, // foreground text
                        minimumSize: const Size(350, 50),
                        side: const BorderSide(
                            color: Colors.grey), // foreground border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        size: 25,
                        color: Colors.white,
                      ),
                      label: const Text('Tiếp tục bằng Google',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton.icon(
                      onPressed: () async {
                        // await signInWithFacebook();
                        // LoginPage.routeName;
                        // // setState(() {});
                      },
                      style: OutlinedButton.styleFrom(
                        // backgroundColor: Colors.white,// background
                        // primary: Colors.orange, // foreground text
                        minimumSize: const Size(350, 50),
                        side: const BorderSide(
                            color: Colors.grey), // foreground border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const Icon(
                        Icons.facebook,
                        size: 32,
                        color: Colors.white,
                      ),
                      label: const Text('Tiếp tục bằng tài khoản Facebook',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        // backgroundColor: Colors.white,// background
                        // primary: Colors.orange, // foreground text
                        minimumSize: const Size(350, 50),
                        side: const BorderSide(
                            color: Colors.grey), // foreground border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const Icon(
                        Icons.apple,
                        size: 32,
                        color: Colors.white,
                      ),
                      label: const Text('Tiếp tục với Apple',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        // side: BorderSide(width: 2, color: Colors.white),
                        minimumSize: const Size(350, 50),
                      ),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
