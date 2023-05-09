import 'package:flutter/material.dart';
import 'package:yoii/auth/LoginPage.dart';
import 'package:yoii/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ungu2,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32, top: 20),
            child: Image.asset(
              'assets/icons/useredit.png',
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.25,
              width: width,
              decoration: const BoxDecoration(
                  color: ungu2,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 50,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Lanang Darma',
                      style: bold.copyWith(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      '087762153144',
                      style: medium.copyWith(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 3,
                          offset: Offset(2, 2),
                          spreadRadius: 1)
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 18),
                          child: Text(
                            'Security',
                            style: bold.copyWith(fontSize: 22),
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/icons/lock1.png',
                            width: 20,
                            height: 20,
                          ),
                          title: Text(
                            'Change Security Code',
                            style: semibold.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 110,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 3,
                          offset: Offset(2, 2),
                          spreadRadius: 1)
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 18),
                          child: Text(
                            'Help',
                            style: bold.copyWith(fontSize: 22),
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/icons/infocircle.png',
                            width: 20,
                            height: 20,
                          ),
                          title: Text(
                            'Help Center',
                            style: semibold.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 580,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 18),
                          child: Text(
                            'About',
                            style: bold.copyWith(fontSize: 22),
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/icons/Crown.png',
                            width: 20,
                            height: 20,
                          ),
                          title: Text(
                            'Platform Advantage',
                            style: semibold.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/icons/Light.png',
                            width: 20,
                            height: 20,
                          ),
                          title: Text(
                            'Guide',
                            style: semibold.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/icons/documenttext.png',
                            width: 20,
                            height: 20,
                          ),
                          title: Text(
                            'Terms and Condition',
                            style: semibold.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/icons/shieldtick.png',
                            width: 20,
                            height: 20,
                          ),
                          title: Text(
                            'Privasy Policy',
                            style: semibold.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/icons/Star.png',
                            width: 20,
                            height: 20,
                          ),
                          title: Text(
                            'Give Rating',
                            style: semibold.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  'Version 1.1',
                                  style: medium.copyWith(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                SizedBox(
                                  width: 220,
                                  height: 50,
                                  child: FilledButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(ungu1)),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const LoginPage();
                                        }));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.logout),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Sign Out',
                                            style:
                                                semibold.copyWith(fontSize: 20),
                                          )
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
