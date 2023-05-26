import 'package:flutter/material.dart';
import 'package:spotify_clone/Blocs/auth_bloc.dart';
import 'package:spotify_clone/page/dialog/loading_dialog.dart';
import 'package:spotify_clone/page/home.dart';
import 'package:spotify_clone/page/register_email.dart';
import 'package:spotify_clone/page/welcomeScreen.dart';
import 'package:spotify_clone/provider/auth.dart';

import 'dialog/msg_dialog.dart';

const logo = '/Group.svg';

class User {
  String name;
  String img;
  String email;
  User(this.name, this.img, this.email);
}

class MyApp extends InheritedWidget {
  final AuthBloc authBloc;
  @override
  final Widget child;
  const MyApp(this.authBloc, this.child, {super.key}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: MyApp);
  }

  void main() {
    runApp(MyApp(
        AuthBloc(),
        const MaterialApp( home: LoginPage(title: '',),
        )));
  }
}

FlatButton({required Text child, required Null Function() onPressed}) {
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  static const routeName = "/login";
  final String title;

  @override
  State<LoginPage> createState() => Login();
}

class Login extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false;
  bool _showPass = false;
  bool _isLoading = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {

    }
    setState(() {
      _isLoading = false;
    });
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void navigateToSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterPage(title: '')));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(WelcomeScreen.routeName);
                  },
                ),
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  'Đăng nhập',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Color(0xffffffff)),
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 33, right: 32),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                              child: TextField(
                                controller: _emailController,
                                style: const TextStyle(fontSize: 18, color: Colors.black),
                                decoration: const InputDecoration(
                                    enabled: true,
                                    filled: true, //<-- SEE HERE
                                    fillColor: Color(0xC2F5F5F5),
                                    hintText: "Email hoặc tên người dùng",
                                    // prefixIcon: Container(
                                    //     width: 50, child: Image.asset("ic_mail.png")),
                                    border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Color(0xffCED0D2), width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(12)))),
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _showPass,
                                  style: const TextStyle(fontSize: 18, color: Colors.black),
                                  decoration: const InputDecoration(
                                    filled: true, //<-- SEE HERE
                                    fillColor: Color(0xC2F5F5F5),
                                    hintText: "Mật khẩu",

                                    // suffixIcon: Icon(Icons.remove_red_eye_outlined),
                                    border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Color(0xffCED0D2), width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(12))
                                    ),
                                    // obscureText: true,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: onToggleShowPass,
                                  child: Column(
                                    children: [
                                      Icon(_showPass ? Icons.not_interested : Icons.remove_red_eye_outlined ),
                                      const SizedBox(width: 50,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox( height: 5,),
                            Container(
                              constraints: BoxConstraints.loose(const Size(double.infinity, 30)),
                              alignment: AlignmentDirectional.centerEnd,
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  "Quên mật khẩu?",
                                  style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                              child: SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  // onPressed: () {
                                  //   Navigator.of(context)
                                  //       .pushReplacementNamed(HomePage() as String);
                                  // },
                                  style: ElevatedButton.styleFrom(
                                    // side: BorderSide(width: 2, color: Colors.white),
                                    primary: Colors.green,
                                    minimumSize: const Size(40, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    "Đăng nhập",
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // )
              ],
            ),
          ),
        )
    );
  }

  // void _onLoginClick() {
  //   String email = _emailController.text;
  //   String pass = _passwordController.text;
  //   var authBloc = MyApp.of(context)?.authBloc;
  //   // LoadingDialog.showLoadingDialog(context, "Loading...");
  //   authBloc?.signIn(email, pass, () {
  //     LoadingDialog.hideLoadingDialog(context);
  //     Navigator.of(context)
  //         .pushReplacementNamed(HomePage() as String);
  //   }, (msg) {
  //     LoadingDialog.hideLoadingDialog(context);
  //     MsgDialog.showMsgDialog(context, "Sign-In", msg);
  //   });
  // }

  // void onToggleShowPass() {
  //   setState(() {
  //     _showPass = !_showPass;
  //   });
  // }
}
