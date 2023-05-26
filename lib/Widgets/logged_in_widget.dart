
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
      backgroundColor: const Color(0xffe80000),

      // appBar: AppBar(
      //   title: const Text('Logn In'),
      //   centerTitle: true,
      //   actions: [
      //     TextButton(onPressed: (){
      //       final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
      //       provider.logout();
      //       }, child: const Text('Lognout'))
      //   ],
      // ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        child: Column(
          children: [
            SizedBox(height: 50,),
            const Text('Profile',
            style: TextStyle(fontSize: 24, color: Color(0xffffffff)),),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user?.photoURL.toString() ?? ''),
            ),
            // SizedBox(height: 10,),
            // Text(user?.displayName.toString() ?? '',
            //   style: TextStyle(color: Color(0xffffffff)),),
            // SizedBox(height: 10,),
            // Text(user?.email.toString() ?? '',
            //   style: TextStyle(color: Color(0xffffffff)),
            // ),
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
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) => const LoginPage(
                                        //             title: '',
                                        //           )),
                                        // );
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
      ),
    );
  }
}
