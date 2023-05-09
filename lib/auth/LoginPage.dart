import 'package:flutter/material.dart';
import 'package:yoii/auth/RegisterPage.dart';
import 'package:yoii/pages/HomePage.dart';
import 'package:yoii/pages/index.dart';
import 'package:yoii/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isPasswordShowed = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ungu2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.5 + 250,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: width,
                        height: 45,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                                text: 'Ganesh',
                                style:
                                    bold.copyWith(fontSize: 32, color: ungu2),
                                children: [
                                  TextSpan(
                                      text: 'Pro',
                                      style: bold.copyWith(
                                          fontSize: 32, color: ungu1))
                                ]),
                          ),
                        )),
                    const SizedBox(
                      height: 31,
                    ),
                    Text(
                      'Login',
                      style: bold.copyWith(fontSize: 24, color: ungu1),
                    ),
                    Text(
                      'Untuk masuk ke akun Anda !',
                      style: medium.copyWith(fontSize: 16, color: ungu2),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Pengguna *',
                              style:
                                  medium.copyWith(fontSize: 16, color: ungu2),
                            ),
                            TextFormField(
                              controller: _usernameController,
                              style: regular.copyWith(
                                  fontSize: 16, color: ungu2),
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.person_outline_rounded,
                                    color: ungu2,
                                  ),
                                  hintText: 'Masukkan nama pengguna',
                                  hintStyle: regular.copyWith(
                                      fontSize: 16, color: Colors.grey[600]),
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ungu2, width: 2)),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ungu2, width: 2))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Nama pengguna tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Kata Sandi *',
                              style:
                                  medium.copyWith(fontSize: 16, color: ungu2),
                            ),
                            TextFormField(
                              obscureText: !isPasswordShowed,
                              controller: _passwordController,
                              style: regular.copyWith(
                                  fontSize: 16, color: ungu2),
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: ungu2,
                                  ),
                                  hintText: 'Masukkan Password',
                                  hintStyle: regular.copyWith(
                                      fontSize: 16, color: Colors.grey[600]),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPasswordShowed =
                                              !isPasswordShowed;
                                        });
                                      },
                                      icon: Icon(isPasswordShowed
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ungu2, width: 1.4)),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ungu2, width: 1.4))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                } else if (value.length <= 6) {
                                  return 'Password minimal 6 karakter';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: Text(
                                    'Lupa Sandi ?',
                                    style: medium.copyWith(
                                        fontSize: 16, color: ungu1),
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 277,
                                  height: 50,
                                  child: FilledButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  ungu1)),
                                      onPressed: () {
                                        // if (_formKey.currentState!.validate()) {
                                        //   _formKey.currentState!.save();
                                        //   print(_usernameController.text);
                                        //   print(_passwordController.text);
                                        // }
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return MainPage();
                                        }));
                                      },
                                      child: Text(
                                        'Login',
                                        style: bold.copyWith(
                                            fontSize: 20,
                                            color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tidak punya akun?',
                                  style: medium.copyWith(fontSize: 16),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => RegisterPage()),
                                      );
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: medium.copyWith(
                                          fontSize: 16, color: Colors.blue),
                                    ))
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 53),
              height: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Atau daftar menggunakan:',
                    style: medium.copyWith(fontSize: 16, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('login');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 18),
                      decoration: BoxDecoration(
                          border: Border.all(color: ungu1, width: 4),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/auth/google.png',
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in with Google',
                            style: semibold.copyWith(
                                fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('login');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 18),
                      decoration: BoxDecoration(
                          border: Border.all(color: ungu1, width: 4),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/auth/atapple.png',
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in with Apple',
                            style: semibold.copyWith(
                                fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('login');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 18),
                      decoration: BoxDecoration(
                          border: Border.all(color: ungu1, width: 4),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/auth/atfb.png',
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in with Facebook',
                            style: semibold.copyWith(
                                fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
