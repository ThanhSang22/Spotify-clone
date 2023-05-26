import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/page/home.dart';
import 'package:spotify_clone/page/register_email.dart';
import 'package:spotify_clone/page/root_app.dart';
import 'package:spotify_clone/page/welcomeScreen.dart';
import 'package:spotify_clone/provider/auth.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool isLoading = false;

  bool _showPass = false;


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
      isLoading = true;

    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const RootApp(),
        ),
      );
    } else {

    }
    setState(() {
      _isLoading = false;
      isLoading = false;

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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              TextField(
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
              const SizedBox(
                height: 24,
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
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: loginUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: Colors.green),
                  child: _isLoading
                      ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                      : const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Flexible(flex: 2, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text("Don't have an account?"),
                  ),
                  GestureDetector(
                    onTap: navigateToSignUp,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}