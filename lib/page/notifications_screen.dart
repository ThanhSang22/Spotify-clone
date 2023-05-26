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
        backgroundColor: const Color(0xe7000000),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
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
        decoration: new BoxDecoration(color: const Color(0xfd000000)),
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Có gì mới',
                        style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10,),
                      const Text('Nội dung phát hành mới nhất từ nghệ sĩ, podcast và chương trình bạn theo dõi.',
                        style:TextStyle(color: Colors.grey, fontSize: 15),),
                      //BUTTON
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0x56C7C7CD),// background
                              // primary: Colors.orange, // foreground text
                              minimumSize: const Size(30, 35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text('Nhạc',
                                style: TextStyle( color: Colors.white)),
                          ),
                          const SizedBox(width: 10,),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0x56C7C7CD),// background
                              // primary: Colors.orange, // foreground text
                              minimumSize: const Size(30, 35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text('Postcast và chương trình',
                                style: TextStyle( color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      const Text(
                          'Mới',
                          style:TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


