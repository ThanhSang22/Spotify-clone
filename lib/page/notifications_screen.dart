import 'package:flutter/material.dart';
import 'package:spotify_clone/page/home.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  static const routeName = "/SittingScreen";

  @override
  State<NotificationsScreen> createState() => _NotificationsScreen();

}

class _NotificationsScreen extends State<NotificationsScreen> {

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
              'Có gì mới',
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
        decoration: new BoxDecoration(color: const Color(0xff000000)),
        child: Stack(
          children: [
            // Align(
            //     alignment: Alignment.topCenter,
            //     child: Row(
            //       children: [
            //         IconButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(builder: (context) => const HomePage()),
            //               );
            //             },
            //             icon: const Icon(
            //               Icons.arrow_back_ios_outlined,
            //               size: 25,
            //               color: Colors.white,
            //             )
            //         ),
            //         const SizedBox(
            //           height: 200,
            //         ),
            //         const Text('Thông báo', style: TextStyle(color: Colors.yellow, fontSize: 30),)
            //       ],
            //     )
            // ),
            ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    Text(
                      'Có gì mới',
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10,),
                    Text('Nội dung phát hành mới nhất từ nghệ sĩ, podcast và chương trình bạn theo dõi.',
                      style:TextStyle(color: Colors.grey, fontSize: 15),),
                    //BUTTON

                    SizedBox(height: 15,),
                    Text(
                      'Mới',
                      style:TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


