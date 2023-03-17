// ignore_for_file: file_names, must_be_immutable

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:presence_kita/screen/auth/auth_view_model.dart';
import 'package:presence_kita/theme.dart';
import 'package:provider/provider.dart';
import 'package:device_info_plus/device_info_plus.dart';

class SignInStudentPage extends StatelessWidget {
  SignInStudentPage({super.key});
  final _formKey = GlobalKey<FormState>();

  TextEditingController nimC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 36,
            bottom: 36,
            left: 51,
            right: 51,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  child: Center(
                    child: Text(
                      'Presence Kita',
                      style: primaryTextStyle.copyWith(
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 2),
                  child: Center(
                      child: Image.asset(
                    'assets/logo_upr.png',
                    width: 150,
                  )),
                ),
                const SizedBox(
                  height: 18,
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 3),
                  child: Center(
                    child: Text(
                      'Silahkan Login',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 3),
                  child: TextFormField(
                    controller: nimC,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
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
                      labelText: 'NIM',
                      labelStyle: primaryTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'NIM tidak boleh kosong';
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 3),
                  child: TextFormField(
                    controller: passC,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
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
                      labelText: 'Password',
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
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DelayedDisplay(
                        delay: const Duration(seconds: 3),
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, '/registerStudentPage'),
                          child: const Text(
                            'Daftar Akun',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 3),
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final deviceInfo = DeviceInfoPlugin();
                        AndroidDeviceInfo androidInfo;
                        androidInfo = await deviceInfo.androidInfo;
                        final androidId = androidInfo.id;

                        var viewModel =
                            // ignore: use_build_context_synchronously
                            Provider.of<AuthViewModel>(context, listen: false);
                        // ignore: use_build_context_synchronously
                        viewModel.signIn(
                            nimC.text, passC.text, androidId, context);
                      }
                    },
                    child: Container(
                      height: 37,
                      width: 128,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Log IN',
                        style: primaryTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
