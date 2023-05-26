import 'package:flutter/material.dart';
import 'package:spotify_clone/Blocs/auth_bloc.dart';
import 'package:spotify_clone/page/home.dart';
import 'package:spotify_clone/page/login.dart';
import 'package:spotify_clone/page/login_page.dart';
import 'package:spotify_clone/page/welcomeScreen.dart';
import 'package:flutter/src/widgets/async.dart';

import '../provider/auth.dart';
import 'dialog/loading_dialog.dart';
import 'dialog/msg_dialog.dart';
import 'dart:async';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});
  static const routeName = "/register";
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = AuthBloc();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _showPass = false;
  bool _isLoading = false;

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              width: 50,
            ),
            const Text(
              'Đăng ký',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: StreamBuilder(
                    stream: authBloc.nameStream,
                    builder: (context, snapshot) => TextField(
                      controller: _nameController,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText:
                            snapshot.hasError ? '${snapshot.error}' : null,
                          hintText: "Tên",
                          prefixIcon: Container(
                              width: 50, child: const Icon(Icons.account_circle_outlined)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)))),
                    )),
              ),
              StreamBuilder(
                  stream: authBloc.phoneStream,
                  builder: (context,snapshot) => TextField(
                    controller: _phoneController,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Số điện thoại",
                        errorText:
                          snapshot.hasError ? '${snapshot.error}' : null,
                        prefixIcon: Container(
                            width: 50, child: const Icon(Icons.phone)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)))),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                    stream: authBloc.emailStream,
                    builder: (context, snapshot) => TextField(
                      controller: _emailController,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          hintText: "Email",
                          errorText:
                            snapshot.hasError ? '${snapshot.error}' : null,
                          prefixIcon: Container(
                              width: 50, child: const Icon(Icons.mail_outline_outlined)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)))),
                    )),
              ),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  StreamBuilder(
                      stream: authBloc.passStream,
                      builder: (context, snapshot) => TextField(
                        controller: _passController,
                        obscureText: _showPass,
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Mật khẩu",
                            errorText:
                              snapshot.hasError ? '${snapshot.error}' : null,
                            prefixIcon: Container(
                                width: 50, child: const Icon(Icons.lock_outline_rounded)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                      )),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _onSignUpClicked,
                    style: ElevatedButton.styleFrom(
                      // side: BorderSide(width: 2, color: Colors.white),
                      primary: Colors.green,
                      minimumSize: const Size(40, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Bạn đã có tài khoản? ",
                        style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginPage.routeName);
                        },
                        child: const Text(
                          "Đăng nhập ngay! ",
                          style: TextStyle(color: Color(0xff3277D8), fontSize: 16),
                        ),
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  _onSignUpClicked() async{

      setState(() {
        _isLoading = true;
      });
      String res = await AuthMethods().signUpUser(
          email: _emailController.text,
          password: _passController.text,
          username: _nameController.text,
         );
      setState(() {
        _isLoading = false;
      });

      if (res != 'success') {

      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const HomePage()),
        );
      }

    void navigateToLogin() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}