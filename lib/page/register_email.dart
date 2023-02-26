import 'package:flutter/material.dart';
import 'package:spotify_clone/page/register_pass.dart';
import 'package:spotify_clone/page/welcomeScreen.dart';

class RegisterEmailScreen extends StatelessWidget {
  const RegisterEmailScreen({Key? key}) : super(key: key);
  static const routeName = "/RegisterEmailScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color(0xff000000)),
        child: Stack(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(WelcomeScreen.routeName);
                  },
                ),
                const SizedBox(
                  width: 150,
                ),
                const Text(
                  'Tạo tài khoản',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 100,right: 32, left: 33),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Email của bạn là gì?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.grey,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10))
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Bạn cần xác nhận email sau này.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(RegisterPassScreen.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                            // side: BorderSide(width: 2, color: Colors.white),
                            primary: Colors.grey,
                            minimumSize: const Size(0, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            "Tiếp",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
