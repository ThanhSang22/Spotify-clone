import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/page/Profile.dart';
import 'package:spotify_clone/page/login.dart';
import 'package:spotify_clone/page/login_page.dart';
import 'package:spotify_clone/models/setting_model.dart';

import '../provider/auth.dart';


class SittingScreen extends StatefulWidget {
  const SittingScreen({Key? key, }) : super(key: key);
  static const routeName = "/SittingScreen";

  @override
  State<SittingScreen> createState() => _SittingState();

}

class _SittingState extends State<SittingScreen> {
  var userData = {};
  getData() async{
    try {
      var snap = AuthMethods().getUserDetails();
      userData = snap as Map;
      setState(() {

      });
    } catch(e) {}
  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    List settings = setting;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xe7000000),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Cài đặt',
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
        decoration: const BoxDecoration(color: Color(0xff000000)),
        child: Stack(
          children: [
            ListView(
              children: [
              Padding(
                padding:
                  const EdgeInsets.only(left: 15, right: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.account_circle_outlined, size: 30, color: Colors.white,),
                              const SizedBox(width: 10,),
                              Column(
                                children:[
                                  Text(
                                    user?.displayName.toString() ?? userData['username'],
                                    style: const TextStyle(color: Colors.white, fontSize: 15),
                                  ),
                                  const SizedBox(height: 2,),
                                  const Text('Xem Hồ sơ', style: TextStyle(color: Colors.grey, fontSize: 10),)
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            alignment: Alignment.centerLeft,
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const Profile(title: '')));
                              },
                              icon: const Icon(
                                Icons.navigate_next_outlined,
                                color: Colors.grey,
                                size: 25,
                              )
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: List.generate(setting.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        // width: MediaQuery.of(context).size.width * 0.31,
                                        // height: 50,
                                        margin: const EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  setting[index]['title'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  setting[index]['icon'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.grey,
                                                      fontSize: 35
                                                  ),
                                                )
                                              ],
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            // side: BorderSide(width: 2, color: Colors.white),
                            primary: Colors.white,
                            minimumSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Đăng xuất',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                          )),
                      const SizedBox(
                        height: 50,
                      )

                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}


