import 'package:flutter/material.dart';
import 'package:yoii/auth/LoginPage.dart';
import 'package:yoii/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _NIMController = TextEditingController();
  final _nohandphoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();

  bool isPasswordShowed = false;

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
              height: height * 0.5 + 630,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
                      height: 28,
                    ),
                    Text(
                      'Sign Up',
                      style: bold.copyWith(fontSize: 24, color: ungu1),
                    ),
                    Text(
                      'Registrasi akun anda!',
                      style: medium.copyWith(fontSize: 16, color: ungu2),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Pengguna *',
                            style: medium.copyWith(fontSize: 16, color: ungu2),
                          ),
                          TextFormField(
                            controller: _usernameController,
                            style: regular.copyWith(fontSize: 16, color: ungu2),
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
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama pengguna tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'NIM *',
                            style: medium.copyWith(fontSize: 16, color: ungu2),
                          ),
                          TextFormField(
                            controller: _NIMController,
                            style: regular.copyWith(fontSize: 16, color: ungu2),
                            decoration: InputDecoration(
                                prefixIcon:
                                    Image.asset('assets/icons/idcard.png'),
                                hintText: 'Masukkan NIM',
                                hintStyle: regular.copyWith(
                                    fontSize: 16, color: Colors.grey[600]),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'NIM tidak boleh kosong';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'No Handphone *',
                            style: medium.copyWith(fontSize: 16, color: ungu2),
                          ),
                          TextFormField(
                            controller: _nohandphoneController,
                            style: regular.copyWith(fontSize: 16, color: ungu2),
                            decoration: InputDecoration(
                                prefixIcon:
                                    Image.asset('assets/icons/telpun.png'),
                                hintText: 'Masukkan No Handphone',
                                hintStyle: regular.copyWith(
                                    fontSize: 16, color: Colors.grey[600]),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'No Handphone tidak boleh kosong';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'E-mail *',
                            style: medium.copyWith(fontSize: 16, color: ungu2),
                          ),
                          TextFormField(
                            controller: _emailController,
                            style: regular.copyWith(fontSize: 16, color: ungu2),
                            decoration: InputDecoration(
                                prefixIcon:
                                    Image.asset('assets/icons/email.png'),
                                hintText: 'Masukkan E-mail',
                                hintStyle: regular.copyWith(
                                    fontSize: 16, color: Colors.grey[600]),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'E-mail tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Alamat *',
                            style: medium.copyWith(fontSize: 16, color: ungu2),
                          ),
                          TextFormField(
                            controller: _locationController,
                            style: regular.copyWith(fontSize: 16, color: ungu2),
                            decoration: InputDecoration(
                                prefixIcon:
                                    Image.asset('assets/icons/location.png'),
                                hintText: 'Masukkan Lokasi',
                                hintStyle: regular.copyWith(
                                    fontSize: 16, color: Colors.grey[600]),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 2))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Lokasi tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Kata Sandi *',
                            style: medium.copyWith(fontSize: 16, color: ungu2),
                          ),
                          TextFormField(
                            obscureText: !isPasswordShowed,
                            controller: _passwordController,
                            style: regular.copyWith(fontSize: 16, color: ungu2),
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
                                        isPasswordShowed = !isPasswordShowed;
                                      });
                                    },
                                    icon: Icon(isPasswordShowed
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 1.4)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ungu2, width: 1.4))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password tidak boleh kosong';
                              } else if (value.length <= 6) {
                                return 'Password minimal 6 karakter';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                                      MaterialStatePropertyAll(ungu1)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }));
                                }
                              },
                              child: Text(
                                'Sign Up',
                                style: bold.copyWith(
                                    fontSize: 20, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 53),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style:
                            medium.copyWith(fontSize: 16, color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            'Log in',
                            style: medium.copyWith(
                                fontSize: 16, color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
