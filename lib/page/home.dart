
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/Widgets/sign_up_widget.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/models/song_model.dart';
import 'package:spotify_clone/page/Song_screen.dart';
import 'package:spotify_clone/page/Song_screen/Song_screen1.dart';
import 'package:spotify_clone/page/Song_screen/Song_screen2.dart';
import 'package:spotify_clone/page/history_screen.dart';
import 'package:spotify_clone/page/notifications_screen.dart';
import 'package:spotify_clone/page/setting.dart';

import '../Widgets/logged_in_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;
  @override
  Widget build(BuildContext context) {
    List<Playlist> playlists = Playlist.playlist;
    List<Song> songs = Song.songs;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData){
            // return LognInWidget();
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Xin chào',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
                    ), //Hello
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                              );
                            },
                            icon: const Icon(
                              Icons.notifications_none_outlined,
                              size: 25,
                              color: Colors.white,
                            )
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HistoryScreen()),
                              );
                            },
                            icon: const Icon(
                              Icons.access_time_outlined,
                              size: 25,
                              color: Colors.white,
                            )
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SittingScreen()),
                              );
                            },
                            icon: const Icon(
                              Icons.settings,
                              size: 25,
                              color: Colors.white,
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
              body: Scaffold(
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const _DiscoverMusic(),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 20.0,
                          bottom: 20.0,
                          right: 10.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tuyển tập hàng đầu của bạn',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('See all',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: playlists.length,
                                itemBuilder: ((context, index) {
                                  return Container(
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            playlists[index].image,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  playlists[index].title,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  playlists[index].name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => const SongScreen2()),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.play_circle,
                                            color: Colors.greenAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hot Music',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('See all',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: songs.length,
                                itemBuilder: ((context, index) {
                                  return Container(
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            songs[index].coverUrl,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  songs[index].title,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  songs[index].description,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => const SongScreen()),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.play_circle,
                                            color: Colors.greenAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }else if(snapshot.hasError){
            return Center(child: Text('Something wwent Worng'));
          } else {
            return SignUpWidget();
          }
        },
      ),
    );

  }
}

class _DiscoverMusic extends StatefulWidget {
  const _DiscoverMusic({Key? key}) : super(key: key);

  @override
  State<_DiscoverMusic> createState() => _DiscoverMusicState();
}

class _DiscoverMusicState extends State<_DiscoverMusic> {
  int activeMenu1 = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.black),
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Mới phát gần đây',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(songs.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(songs[index]['img']),
                                                fit: BoxFit.cover,

                                            ),
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        // width: MediaQuery.of(context).size.width * 0.31,
                                        // height: 50,
                                        margin: const EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  songs[index]['title'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  songs[index]['description'],
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                )
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                        const SongScreen1()),
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.greenAccent,
                                                ))
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
                      )
                    ],
                  ),
                ])),
      ),

    );
  }
}
