import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/pages/GigsPage.dart';
import 'package:yoii/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class BuatLayanan extends StatefulWidget {
  const BuatLayanan({super.key});

  @override
  State<BuatLayanan> createState() => _BuatLayananState();
}

class _BuatLayananState extends State<BuatLayanan> {
  late File? _getImage;
  final imageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      _getImage = File(pickedFile!.path);
    });

    imageController.text = _getImage!.path;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ungu2,
        shadowColor: Colors.transparent,
        title: Text(
          'Buka Layanan',
          style: semibold.copyWith(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Buat_Layanan.png"),
              Stack(
                children: [
                  Form(
                      key: _formKey,
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Brand",
                                  style: semibold.copyWith(
                                      fontSize: 20, color: ungu2),
                                ),
                                Text(
                                  "Nama brand merupakan suatu hal kunci dalam bisnis, silahkan buat nama yang mudah diingat pelanggan.",
                                  style: regular.copyWith(
                                      fontSize: 13,
                                      color: Colors.grey.withOpacity(0.6)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              style: BorderStyle.solid,
                                              color: ungu1,
                                              width: 1))),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Detail Brand",
                                  style: semibold.copyWith(
                                      fontSize: 20, color: ungu2),
                                ),
                                Text(
                                  "Penjelasan terkait brand anda merupakan suuatu hal yang penting untuk menarik minat pelanggan.",
                                  style: regular.copyWith(
                                      fontSize: 13,
                                      color: Colors.grey.withOpacity(0.6)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              style: BorderStyle.solid,
                                              color: ungu1,
                                              width: 1))),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: TextFormField(
                                      controller: imageController,
                                      decoration: InputDecoration(
                                          labelText: 'Image URL'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    )),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                  height: 150.0,
                                                  child: Column(children: [
                                                    ListTile(
                                                      leading: Icon(
                                                          Icons.camera_alt),
                                                      title: Text('Camera'),
                                                      onTap: () {
                                                        _pickImage(
                                                            ImageSource.camera);
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: Icon(
                                                          Icons.photo_library),
                                                      title: Text('Gallery'),
                                                      onTap: () {
                                                        _pickImage(ImageSource
                                                            .gallery);
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ]));
                                            });
                                      },
                                      icon: Icon(Icons.add_a_photo),
                                      tooltip: 'Add Image',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: ungu2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GigsPage()));
                                  },
                                  child: Text(
                                    'Submit',
                                    style: semibold.copyWith(fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.1,
                                )
                              ]))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
