import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:presence_kita/common/widgets/submit_button_widget.dart';
import 'package:presence_kita/theme.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
          'Ubah Password',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextFormField(
                controller: oldPassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'Password Lama',
                  labelStyle: primaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Password tidak boleh kosong';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: newPassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'Password Baru',
                  labelStyle: primaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Password tidak boleh kosong';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: confirmNewPassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'Konfirmasi Password Baru',
                  labelStyle: primaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                validator: (value) {
                  if (value != newPassword.text) {
                    return 'Password Baru Tidak Sama';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: const SubmitButtonWidget(title: 'Ubah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
