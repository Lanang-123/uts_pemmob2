import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:yoii/pages/index.dart';
import 'package:yoii/theme.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';

class GigOrder extends StatefulWidget {
  const GigOrder({super.key});

  @override
  State<GigOrder> createState() => _GigOrderState();
}

class _GigOrderState extends State<GigOrder> {
  final _formKey = GlobalKey<FormState>();

  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  TextEditingController _detailContentController = TextEditingController();
  TextEditingController _fileController = TextEditingController();
  TextEditingController _cossController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  DateTime _selectedTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0);
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime),
    );
    if (timeOfDay != null) {
      setState(() {
        _selectedTime = DateTime(
          _selectedTime.year,
          _selectedTime.month,
          _selectedTime.day,
          timeOfDay.hour,
          timeOfDay.minute,
        );
      });
    }
  }

  @override
  void initState() {
    _timeController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final apBar = AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 2,
      backgroundColor: ungu2,
      title: Text(
        'Detail Pemesanan',
        style: semibold.copyWith(fontSize: 16, color: Colors.white),
      ),
    );

    double heighBody = height - apBar.preferredSize.height;

    return Scaffold(
      backgroundColor: ungu2,
      appBar: apBar,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          width: width,
          height: height - 75,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Design Poster",
                  style: bold.copyWith(fontSize: 22, color: ungu1),
                ),
                Text(
                  "Silakan masukkan detail pesanan anda!",
                  style: regular.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Batas waktu yang anda berikan!',
                  style: semibold.copyWith(fontSize: 15, color: ungu1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFormField(
                        readOnly: true,
                        onTap: () => _selectTime(context),
                        decoration: InputDecoration(
                          labelText: 'Time',
                          labelStyle: regular.copyWith(color: ungu1),
                          suffixIcon: Icon(
                            Icons.access_time,
                            color: ungu1,
                          ),
                        ),
                        initialValue:
                            DateFormat('h:mm a').format(_selectedTime),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a time';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 180,
                      child: DateTimeField(
                        decoration: InputDecoration(
                          labelText: 'Date',
                          labelStyle: regular.copyWith(color: ungu1),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: ungu1,
                          ),
                        ),
                        format: _dateFormat,
                        initialValue: _selectedDate,
                        validator: (value) {
                          if (value == null) {
                            return 'Mohon pilih tanggal';
                          }
                          return null;
                        },
                        onShowPicker: (context, currentValue) async {
                          final selectedDate = await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2030, 12, 31),
                            onConfirm: (date) {
                              setState(() {
                                _selectedDate = date;
                              });
                            },
                            currentTime: _selectedDate,
                            locale: LocaleType.en,
                          );
                          return selectedDate;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Masukkan detail konten!',
                  style: semibold.copyWith(fontSize: 15, color: ungu1),
                ),
                TextFormField(
                  controller: _detailContentController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "Ketik disini...",
                      hintStyle: regular.copyWith(
                          fontSize: 15, color: Colors.grey.withOpacity(0.6)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              color: ungu1,
                              width: 1))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Tambahkan file!',
                  style: semibold.copyWith(fontSize: 15, color: ungu1),
                ),
                TextFormField(
                  controller: _fileController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      prefixIcon: const Icon(
                        Icons.link,
                        size: 25,
                        color: ungu1,
                      ),
                      isDense: true,
                      hintText: "Sisipkan file",
                      hintStyle: regular.copyWith(
                          fontSize: 15, color: Colors.grey.withOpacity(0.6)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              color: ungu1,
                              width: 1))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Pilih paket jasa!',
                  style: semibold.copyWith(fontSize: 15, color: ungu1),
                ),
                TextFormField(
                  controller: _cossController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    prefixIcon: Image.asset(
                      "assets/icons/coss.png",
                      width: 20,
                      height: 20,
                    ),
                    isDense: true,
                    hintText: "Masukkan harga",
                    hintStyle: regular.copyWith(
                        fontSize: 15, color: Colors.grey.withOpacity(0.6)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 45,
                    child: FilledButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12)),
                            backgroundColor: MaterialStatePropertyAll(ungu1)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    color: ungu1.withOpacity(0.3),
                                    width: width,
                                    height: 100,
                                    child: AlertDialog(
                                      backgroundColor: ungu1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Pesanan Telah Dikirim',
                                              textAlign: TextAlign.center,
                                              style: bold.copyWith(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Terimakasih telah melakukan pesanan',
                                              style: regular.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            FilledButton.icon(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.white)),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return MainPage(page: 0,);
                                                  }));
                                                },
                                                icon: Icon(
                                                  Icons.home,
                                                  color: ungu1,
                                                ),
                                                label: Text(
                                                  'Beranda',
                                                  style: bold.copyWith(
                                                      fontSize: 15,
                                                      color: ungu1),
                                                ))
                                          ],
                                        ),
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Text(
                          "Kirim",
                          style:
                              bold.copyWith(fontSize: 16, color: Colors.white),
                        )),
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
