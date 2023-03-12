import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/submit_button_widget.dart';
import 'package:presence_kita/theme.dart';

class EditrSessionPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  EditrSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          'Edit Session',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Materi Pembelajaran',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Materi Pembelajaran',
                    labelStyle: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Tidak boleh kosong';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Batas Presensi Masuk',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Batas Presensi Masuk',
                    labelStyle: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Tidak boleh kosong';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Batas Presensi Keluar',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Batas Presensi Keluar',
                    labelStyle: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Tidak boleh kosong';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Tanggal',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  readOnly: true,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Tanggal',
                    labelStyle: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Tidak boleh kosong';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Pilih Dosen Pengajar',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  readOnly: true,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Pilih Dosen',
                    labelStyle: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return 'Tidak boleh kosong';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Aktifkan Geolocation?',
                  style: primaryTextStyle,
                ),
                Row(
                  children: [
                    Text(
                      'Y',
                      style: primaryTextStyle.copyWith(
                        fontSize: 40,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Text(
                      'N',
                      style: primaryTextStyle.copyWith(
                        fontSize: 40,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: GestureDetector(
                    child: const Center(
                      child: SubmitButtonWidget(
                        title: 'Tambah',
                      ),
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
