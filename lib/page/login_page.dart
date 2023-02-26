import 'package:flutter/material.dart';
import 'package:spotify_clone/page/root_app.dart';
import 'package:spotify_clone/page/welcomeScreen.dart';

const logo = '/Group.svg';

class User {
  String name;
  String img;
  String email;
  User(this.name, this.img, this.email);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: LoginPage(
        title: '',
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  static const routeName = "/login";
  final String title;

  @override
  State<LoginPage> createState() => Login();
}

class Login extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false;

  void showFaileMessage() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Login"),
              content: const Text("Login failed"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, "Ok");
                    },
                    child: const Text("Ok"))
              ],
            ));
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
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(WelcomeScreen.routeName);
                  },
                ),
                const SizedBox(
                  width: 100,
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
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  // width: 800,
                  height: 900,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.only(left: 33, right: 32, top: 38),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                  height: 20,
                                  ),
                                  //styling
                                  const Text(
                                    "Email hoặc tên người dùng",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        fillColor: Colors.grey,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                  ),
                                  //box styling
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Mật khẩu",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  //text input
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        fillColor: Colors.grey,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                    obscureText: true,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                              ]),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    // style: ElevatedButton.styleFrom(
                                    //     primary: const Color(0xff00cea6)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, RootApp.routeName,
                                          arguments: User("Thanh Sang", 'avatar.png',
                                              'thanhsang@gmail.com'));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      // side: BorderSide(width: 2, color: Colors.white),
                                      primary: Colors.grey,
                                      minimumSize: const Size(100, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      'Đăng nhập',
                                      style: TextStyle(fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 30,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: const [
                              //     Text(
                              //       "Or Continue with",
                              //       style: TextStyle(
                              //         fontSize: 14,
                              //         color: (Colors.grey),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              //
                              // const SizedBox(
                              //   height: 30,
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: const [
                              //     Text(
                              //       "Already have an account?",
                              //       style: TextStyle(
                              //         fontSize: 16,
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 10,
                              //     ),
                              //     Text(
                              //       "Sign in.",
                              //       style: TextStyle(
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600,
                              //           color: Color(0xff00BC97)),
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
