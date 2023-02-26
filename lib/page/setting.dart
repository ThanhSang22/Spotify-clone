import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/models/song_model.dart';
import 'package:spotify_clone/page/Song_screen.dart';
import 'package:spotify_clone/page/Song_screen/Song_screen1.dart';
import 'package:spotify_clone/page/Song_screen/Song_screen2.dart';
import 'package:spotify_clone/page/home.dart';
import 'package:spotify_clone/page/login_page.dart';
import 'package:spotify_clone/page/welcomeScreen.dart';

class SittingScreen extends StatefulWidget {
  const SittingScreen({Key? key}) : super(key: key);
  static const routeName = "/SittingScreen";

  @override
  State<SittingScreen> createState() => _SittingState();

}

class _SittingState extends State<SittingScreen> {

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
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }
            ),
            const SizedBox(
              width: 100,
            ),
            const Text(
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
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Row(
            //     children: [
            //       IconButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => HomePage()),
            //         );
            //        },
            //           icon: Icon(
            //             Icons.arrow_back_ios_outlined,
            //             size: 25,
            //             color: Colors.white,
            //           )
            //       ),
            //       SizedBox(
            //         height: 200,
            //       ),
            //       Text('Cài đặt', style: TextStyle(color: Colors.yellow, fontSize: 30),)
            //     ],
            //   )
            // ),
            ListView(
              children: [
              Padding(
                padding:
                  const EdgeInsets.only(left: 10, right: 15),
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
                                children: const[
                                  Text('Thanh Sang', style:TextStyle(color: Colors.white, fontSize: 15),),
                                  SizedBox(height: 2,),
                                  Text('Xem Hồ sơ', style: TextStyle(color: Colors.grey, fontSize: 10),)
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            alignment: Alignment.centerLeft,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.navigate_next_outlined,
                                color: Colors.grey,
                                size: 25,
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Tài khoản',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                              ),
                            ),
                            IconButton(
                                alignment: Alignment.centerLeft,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.navigate_next_outlined,
                                  color: Colors.grey,
                                  size: 25,
                                )
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginPage.routeName);
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
                          ))
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


