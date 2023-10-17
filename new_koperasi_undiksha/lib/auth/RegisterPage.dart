import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_koperasi_undiksha/api/auth_api.dart';
import 'package:new_koperasi_undiksha/auth/LoginPage.dart';
import 'package:new_koperasi_undiksha/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nimController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return WideLayoutRegister(
          width: width,
          height: height,
          isChecked: isChecked,
        );
      } else if (constraints.maxWidth < 254) {
        return SmallLayoutRegister(
          width: width,
          height: height,
          isChecked: isChecked,
        );
      } else {
        return NarrowLayoutRegister(
          width: width,
          height: height,
          isChecked: isChecked,
        );
      }
    });
  }
}

class WideLayoutRegister extends StatefulWidget {
  final double width;
  final double height;
  final bool isChecked;
  const WideLayoutRegister(
      {super.key,
      required this.width,
      required this.height,
      required this.isChecked});

  @override
  State<WideLayoutRegister> createState() => _WideLayoutRegisterState();
}

class _WideLayoutRegisterState extends State<WideLayoutRegister> {
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
              top: 420,
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
                child: Text('Silahkan Register terlebih dahulu',
                    style: tebal.copyWith(fontSize: 20)),
              ),
            ),
            Positioned(
              top: 490,
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
                        decoration: InputDecoration(
                            label: Text('Nama'),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 15, 39, 255)))),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
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
                        decoration: InputDecoration(
                            label: Text('NIM'),
                            prefixIcon: Icon(Icons.credit_card_rounded),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 15, 39, 255)))),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
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
                      SizedBox(
                        width: widget.width,
                        height: 55,
                        child: FilledButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue[900])),
                            child: Text(
                              "Register",
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
                                text: ' Login',
                                style: sedang.copyWith(color: Colors.blue[900]),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
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

class NarrowLayoutRegister extends StatefulWidget {
  final double width;
  final double height;
  final bool isChecked;
  NarrowLayoutRegister({
    super.key,
    required this.width,
    required this.height,
    required this.isChecked,
  });

  @override
  State<NarrowLayoutRegister> createState() => _NarrowLayoutRegisterState();
}

class _NarrowLayoutRegisterState extends State<NarrowLayoutRegister> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nimController = TextEditingController();
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
              padding: const EdgeInsets.symmetric(vertical: 40),
              alignment: Alignment.topCenter,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png",
                      width: 150, height: 150),
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
              top: 250,
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
                child: Text('Silahkan Register terlebih dahulu',
                    style: tebal.copyWith(fontSize: 14)),
              ),
            ),
            Positioned(
              top: 300,
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
                          controller: _namaController,
                          decoration: InputDecoration(
                              label: Text('Nama'),
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 15, 39, 255)))),
                        ),
                        const SizedBox(height: 15),
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
                          controller: _nimController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              label: Text('NIM'),
                              prefixIcon: Icon(Icons.credit_card_rounded),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 15, 39, 255)))),
                        ),
                        const SizedBox(height: 15),
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
                        SizedBox(
                          width: widget.width,
                          height: 55,
                          child: FilledButton(
                              onPressed: () async {
                                _formKey.currentState!.save();
                                
                                String nama = _namaController.text;
                                String username = _usernameController.text;
                                String nim = _nimController.text;
                                String password = _passwordController.text;

                                
                                await _authController.register(nama, username, password, nim).then((value) {
                                  if (value != null) {
                                    if (value['success'] == true) {
                                      // Registrasi berhasil
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Registrasi berhasil!'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );

                                      // Navigasi ke halaman login setelah notifikasi ditampilkan
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return LoginPage(); // Gantilah LoginPage dengan nama kelas halaman login Anda
                                      }));
                                    } else if (value['message'] == 'The username has already been taken') {
                                      // Nama pengguna sudah terdaftar
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Nama pengguna sudah terdaftar.'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      // Menangani kondisi lain jika diperlukan
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Registrasi gagal: ${value['message']}'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  } else {
                                    // Menangani jika value null
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Registrasi gagal: Username & email sudah terdaftar'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                });

                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue[900])),
                              child: Text(
                                "Register",
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
                                  text: ' Login',
                                  style: sedang.copyWith(color: Colors.blue[900]),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return LoginPage();
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

class SmallLayoutRegister extends StatefulWidget {
  final double width;
  final double height;
  final bool isChecked;
  const SmallLayoutRegister(
      {super.key,
      required this.width,
      required this.height,
      required this.isChecked});

  @override
  State<SmallLayoutRegister> createState() => _SmallLayoutRegisterState();
}

class _SmallLayoutRegisterState extends State<SmallLayoutRegister> {
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
                child: Text('Silahkan Register terlebih dahulu',
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
                              "Register",
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
                                text: ' Login',
                                style: sedang.copyWith(color: Colors.blue[900]),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
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
