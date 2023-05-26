
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spotify_clone/page/login_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  static const routeName = "/User";

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: getBody(context),
    );
  }
}

Widget getBody(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;

  return  Container(
    alignment: Alignment.center,
    color: Colors.black,
    child: Column(
      children: [
        SizedBox(height: 50,),
        const Text('Profile',
          style: TextStyle(fontSize: 24, color: Color(0xffffffff)),),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(user?.photoURL.toString() ?? ''),
        ),
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Container(
                child: Stack(
                  children: [
                    const Text(
                      "Personal Information",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, right: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                user?.displayName.toString() ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginPage(
                                                title: '',
                                              )),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                user?.email.toString() ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Language",
                                style: const TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 180),
                      child: const Text(
                        "About",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 200, right: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Privacy",
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Storage",
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Audio Quality",
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          )
        ]),
      ],
    ),
  );
}
