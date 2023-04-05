import 'package:flutter/material.dart';
import 'package:spotify_clone/page/Song_screen.dart';
import 'package:spotify_clone/page/dowload_page.dart';
import 'package:spotify_clone/page/favorite_page.dart';
import 'package:spotify_clone/page/home.dart';
import 'package:spotify_clone/page/user_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);
  static const routeName = "/RootApp";

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151521),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        Favorite(),
        SongScreen(),
        // DowloadPage(),
        UserPage(),
      ],
    );
  }

  Widget getFooter() {
    List items = [
      Icons.home,
      Icons.favorite,
      Icons.play_circle,
      // Icons.download,
      Icons.person,
    ];
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: Color(0xff24242E)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return IconButton(
                  icon: Icon(
                    items[index],
                    color:
                        activeTab == index ? const Color(0xff24CBCA) : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  });
            })),
      ),
    );
  }
}
