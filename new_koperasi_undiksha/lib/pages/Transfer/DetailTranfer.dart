import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_koperasi_undiksha/theme.dart';

class DetailTransfer extends StatefulWidget {
  const DetailTransfer({super.key});

  @override
  State<DetailTransfer> createState() => _DetailTransferState();
}

class _DetailTransferState extends State<DetailTransfer> {
  final _formKey = GlobalKey<FormState>();
  final dio = Dio();
  TextEditingController _nominalController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: birutua,
        title: Text('Transfer Dana',style: sedang.copyWith(fontSize: 14,color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height * 0.25 - 70,
                color: birutua,
              ),
              Positioned(
                top: 50,
                left: 12,
                right: 12,
                child: Container(
                  width: width,
                  height: 300,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 1,
                        color: const Color.fromARGB(255, 218, 218, 218),
                        spreadRadius: 1
                      )
                    ]
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: const Color.fromARGB(255, 232, 232, 232),
                                width: 1
                              )
                            )
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.network("https://www.pngarts.com/files/10/Default-Profile-Picture-Transparent-Image.png",fit: BoxFit.cover,width: 35,height: 35,),
                                radius: 25,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Lanang Darma",style: sedang.copyWith(fontSize: 18,color: Colors.grey),),
                                 
                                  Text("No Rek. 213434343",style: sedang.copyWith(fontSize: 15,color: Colors.black),),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Jumlah Kirim",style: sedang.copyWith(fontSize: 14,color: Colors.grey),),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          autofocus: true,
                          controller: _nominalController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong';
                              }

                              // Tambahan validasi: pastikan nilai yang dimasukkan adalah angka
                              try {
                                double.parse(value);
                              } catch (e) {
                                return 'Nominal harus berupa angka';
                              }

                              return null; // Return null jika nilai valid
                            },
                          decoration: InputDecoration(
                            prefixText: 'Rp ',
                            prefixStyle:  tebal.copyWith(fontSize: 30,color: Colors.black),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none
                            )
                          ),
                          style: tebal.copyWith(fontSize: 30,color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                       TextFormField(
                        controller: _keteranganController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.book),
                          contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              
                            )
                          ),
                          hintText: 'Masukkan keterangan (Optional)'
                        ),
                       )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        )
      ),
      floatingActionButton: Container(
        width: width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 1,
                color: const Color.fromARGB(255, 218, 218, 218),
                spreadRadius: 1
              )
            ]
        ),
        child: Center(
          child: SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(birutua)
              ),
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NewScaffold(nominalController: _nominalController,keteranganController: _keteranganController,);
                  },
                );
              }, child: Text("Transfer",style: sedang.copyWith(fontSize: 20,color: Colors.white),)),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



class NewScaffold extends StatefulWidget {
  final TextEditingController nominalController;
  final TextEditingController keteranganController;

  NewScaffold({required this.nominalController, required this.keteranganController});


  @override
  State<NewScaffold> createState() => _NewScaffoldState();
}

class _NewScaffoldState extends State<NewScaffold> {
  final _formKey = GlobalKey<FormState>();
  final dio = Dio();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var nominal = widget.nominalController.text;
    var keterangan = widget.keteranganController.text;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: birutua,
        title: Text('KATA SANDI'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
           height: MediaQuery.of(context).size.height - kToolbarHeight,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Masukkan kata sandi',style: sedang.copyWith(fontSize: 20),),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller:_passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        
                      )
                    ),
                    hintText: 'Kata sandi...'
                  ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                    padding: MaterialStatePropertyAll(const EdgeInsets.symmetric(vertical: 10,horizontal: 8)),
                    backgroundColor: MaterialStatePropertyAll(birutua)
                  ),
                    onPressed: () {
                      final data = {
                        'nominal' : nominal,
                        'keterangan' : keterangan,
                        'password' : _passwordController.text
                      };
                      print(data);
                    },
                    child: Text('Kirim'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 