import 'package:flutter/material.dart';
import 'package:spotify_clone/page/home.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  static const routeName = "/HistoryScreen";

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
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
                }),
            const Text(
              'Mới phát gần đây',
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
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Hôm nay',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Column(
                          children: const [
                            Text(
                              'Hôm qua',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Column(
                          children: const [
                            Text(
                              'Hôm kia',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
