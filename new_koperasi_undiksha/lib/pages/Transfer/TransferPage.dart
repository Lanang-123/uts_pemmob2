import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_koperasi_undiksha/pages/Transfer/DetailTranfer.dart';
import 'package:new_koperasi_undiksha/theme.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _formKey = GlobalKey<FormState>();
  final dio = Dio();

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: birutua,
        title: Text("Pilih rekening bank",style: sedang.copyWith(fontSize: 14,color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * 0.25 - 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 1,
                        color: const Color.fromARGB(255, 218, 218, 218),
                        spreadRadius: 1
                      )
                    ]
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 10
                              ),gapPadding: 2
                            ),
                            
                            
                            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                            hintText: 'Cari no rekening',
                            hintStyle: sedang.copyWith(fontSize: 12,color: Colors.grey[400]),
                            
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 40,
                        height: 50,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 25,color: birutua,)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Container(
                    width: width,
                    height: height * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 1,
                          color: const Color.fromARGB(255, 218, 218, 218),
                          spreadRadius: 1
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text("Transfer Baru",style: tebal.copyWith(fontSize: 15),),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (BuildContext context,index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                        return DetailTransfer();
                                      }));
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.person_3_outlined,size: 30,color: birutua,),
                                      title: Text("Lanang Darma",style: biasa.copyWith(fontSize: 20,color: Colors.black),),
                                      subtitle: Text("NO Rek. 232932929",style: sedang.copyWith(fontSize: 13,color: Colors.grey),),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey[300],
                                  )
                                ],
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}