import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({super.key, required this.title});
  static const routeName = "/profile";
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int activeMenu1 = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.black),
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user?.photoURL.toString() ?? ''),
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.displayName.toString() ?? 'Sang',
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: const [
                        Text('0 ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),),
                        Text('người theo dõi', style: TextStyle(color: Colors.grey),),
                        SizedBox(width: 5,),
                        const Text('.', style: TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(width: 5,),
                        Text('Đang theo dõi ', style: TextStyle(color: Colors.grey),),
                        Text('9 ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 50,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    // backgroundColor: Colors.white,// background
                    // primary: Colors.orange, // foreground text
                    minimumSize: const Size(50, 40),
                    side: const BorderSide(
                        color: Colors.grey), // foreground border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text('Chỉnh sửa',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
                // Text(
                //   user?.email.toString() ?? '',
                //   style: const TextStyle(color: Colors.white),
                // ),
                const SizedBox(width: 10,),
                const Text('...', style: TextStyle(fontSize: 30, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 100,),
            Column(
              children: const [
                Text('Không có hoạt động gần đây.',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 10,),
                Text('Khám phá thêm nhạc mới ngay',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      )
    );
  }


}