import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_koperasi_undiksha/api/auth_api.dart';
import 'package:new_koperasi_undiksha/auth/RegisterPage.dart';
import 'package:new_koperasi_undiksha/index.dart';
import 'package:new_koperasi_undiksha/pages/HomePage.dart';
import 'package:new_koperasi_undiksha/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return WideLayoutLogin(
          width: width,
          height: height,
          isChecked: isChecked,
        );
      } else if (constraints.maxWidth < 254) {
        return SmallLayoutLogin(
          width: width,
          height: height,
          isChecked: isChecked,
        );
      } else {
        return NarrowLayoutLogin(
          width: width,
          height: height,
          isChecked: isChecked,
        );
      }
    });
  }
}

class WideLayoutLogin extends StatefulWidget {
  final double width;
  final double height;
  final bool isChecked;
  const WideLayoutLogin(
      {super.key,
      required this.width,
      required this.height,
      required this.isChecked});

  @override
  State<WideLayoutLogin> createState() => _WideLayoutLoginState();
}

class _WideLayoutLoginState extends State<WideLayoutLogin> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isChecked = widget.isChecked;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: widget.height,
              width: widget.width,
              padding: const EdgeInsets.symmetric(vertical: 50),
              alignment: Alignment.topCenter,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png",
                      width: 300, height: 300),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "KOPERASI UNDIKSHA",
                    style: tebal.copyWith(fontSize: 28, color: Colors.white),
                  )
                ],
              ),
            ),
            Positioned(
              top: 450,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 32),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Text('Silahkan login terlebih dahulu',
                    style: tebal.copyWith(fontSize: 18)),
              ),
            ),
            Positioned(
              top: 530,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50 / 2),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Colors.grey,
                                      blurRadius: 2,
                                      spreadRadius: 0)
                                ]),
                            child: Image.asset(
                              "assets/images/google.png",
                              scale: 1.4,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50 / 2),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Colors.grey,
                                      blurRadius: 2,
                                      spreadRadius: 0)
                                ]),
                            child: Image.asset(
                              "assets/images/phone.png",
                              scale: 1.4,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("Atau dengan akun undiksha",
                          style: sedang.copyWith(
                              fontSize: 18, color: Colors.grey[500])),
                      const SizedBox(
                        height: 23,
                      ),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            label: Text('Username'),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 15, 39, 255)))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 15, 39, 255)))),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("Remember Me", style: biasa)
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Lupa Password ?",
                                style: sedang.copyWith(
                                    fontSize: 14, color: Colors.blue[900]),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: widget.width,
                        height: 55,
                        child: FilledButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue[900])),
                            child: Text(
                              "LOGIN",
                              style: sedang.copyWith(
                                  fontSize: 18, color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Belum memiliki akun ? ',
                                  style:
                                      sedang.copyWith(color: Colors.grey[400]),
                                  children: [
                            TextSpan(
                                text: ' Daftar akun',
                                style: sedang.copyWith(color: Colors.blue[900]),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return RegisterPage();
                                    }));
                                  })
                          ])))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NarrowLayoutLogin extends StatefulWidget {
  final double width;
  final double height;
  final bool isChecked;
  NarrowLayoutLogin({
    super.key,
    required this.width,
    required this.height,
    required this.isChecked,
  });

  @override
  State<NarrowLayoutLogin> createState() => _NarrowLayoutLoginState();
}

class _NarrowLayoutLoginState extends State<NarrowLayoutLogin> {
   final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;
  String _password = '';

  final AuthController _authController = AuthController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = widget.isChecked;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: widget.height,
              width: widget.width,
              padding: const EdgeInsets.symmetric(vertical: 50),
              alignment: Alignment.topCenter,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png",
                      width: 180, height: 180),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "KOPERASI UNDIKSHA",
                    style: tebal.copyWith(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Text('Silahkan login terlebih dahulu',
                    style: tebal.copyWith(fontSize: 14)),
              ),
            ),
            Positioned(
              top: 350,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50 / 2),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 2),
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        spreadRadius: 0)
                                  ]),
                              child: Image.asset(
                                "assets/images/google.png",
                                scale: 1.4,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50 / 2),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 2),
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        spreadRadius: 0)
                                  ]),
                              child: Image.asset(
                                "assets/images/phone.png",
                                scale: 1.4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text("Atau dengan akun undiksha",
                            style: sedang.copyWith(
                                fontSize: 12, color: Colors.grey[500])),
                        const SizedBox(
                          height: 23,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                              label: Text('Username'),
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 15, 39, 255)))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            } else if (value.length < 8) {
                              return 'Password minimal 8 karakter';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                    onPressed: togglePasswordVisibility,
                                    icon: Icon(
                                      _showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                  )),
                              label: Text('Password'),
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 15, 39, 255)))),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    }),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text("Remember Me", style: biasa)
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Lupa Password ?",
                                  style: sedang.copyWith(
                                      fontSize: 14, color: Colors.blue[900]),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          width: widget.width,
                          height: 55,
                          child: FilledButton(
                              onPressed: () async {
                                  _formKey.currentState!.save();

                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                await _authController
                                      .login(username, password)
                                      .then((value) async {
                                    if (value['success'] == false) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Email atau Password salah'),
                                          duration: Duration(
                                              seconds: 2), // Durasi notifikasi
                                        ),
                                      );
                                    } else if (value['success'] == true) {
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(
                                          'token',
                                          value[
                                              'token']); // Simpan token ke dalam SharedPreferences
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MainPage();
                                      }));
                                    }
                                  });



                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue[900])),
                              child: Text(
                                "LOGIN",
                                style: sedang.copyWith(
                                    fontSize: 18, color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                            child: RichText(
                                text: TextSpan(
                                    text: 'Belum memiliki akun ? ',
                                    style:
                                        sedang.copyWith(color: Colors.grey[400]),
                                    children: [
                              TextSpan(
                                  text: ' Daftar',
                                  style: sedang.copyWith(color: Colors.blue[900]),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return RegisterPage();
                                      }));
                                    })
                            ])))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallLayoutLogin extends StatefulWidget {
  final double width;
  final double height;
  final bool isChecked;
  const SmallLayoutLogin(
      {super.key,
      required this.width,
      required this.height,
      required this.isChecked});

  @override
  State<SmallLayoutLogin> createState() => _SmallLayoutLoginState();
}

class _SmallLayoutLoginState extends State<SmallLayoutLogin> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isChecked = widget.isChecked;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: widget.height,
              width: widget.width,
              padding: const EdgeInsets.symmetric(vertical: 50),
              alignment: Alignment.topCenter,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png",
                      width: 180, height: 180),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "KOPERASI UNDIKSHA",
                    style: tebal.copyWith(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Text('Silahkan login terlebih dahulu',
                    style: tebal.copyWith(fontSize: 14)),
              ),
            ),
            Positioned(
              top: 350,
              child: Container(
                width: widget.width,
                height: widget.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50 / 2),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Colors.grey,
                                      blurRadius: 2,
                                      spreadRadius: 0)
                                ]),
                            child: Image.asset(
                              "assets/images/google.png",
                              scale: 1.4,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50 / 2),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Colors.grey,
                                      blurRadius: 2,
                                      spreadRadius: 0)
                                ]),
                            child: Image.asset(
                              "assets/images/phone.png",
                              scale: 1.4,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text("Atau dengan akun undiksha",
                          style: sedang.copyWith(
                              fontSize: 12, color: Colors.grey[500])),
                      const SizedBox(
                        height: 23,
                      ),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            label: Text('Username'),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 15, 39, 255)))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 15, 39, 255)))),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("Remember Me", style: biasa)
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Lupa Password ?",
                                style: sedang.copyWith(
                                    fontSize: 14, color: Colors.blue[900]),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: widget.width,
                        height: 55,
                        child: FilledButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue[900])),
                            child: Text(
                              "LOGIN",
                              style: sedang.copyWith(
                                  fontSize: 18, color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Belum memiliki akun ? ',
                                  style:
                                      sedang.copyWith(color: Colors.grey[400]),
                                  children: [
                            TextSpan(
                                text: ' Daftar',
                                style: sedang.copyWith(color: Colors.blue[900]),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return RegisterPage();
                                    }));
                                  })
                          ])))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
