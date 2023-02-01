import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/submit_button_widget.dart';
import 'package:presence_kita/theme.dart';

class SignInMajortPage extends StatelessWidget {
  SignInMajortPage({super.key});
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
                      'Attendity',
                      style: primaryTextStyle.copyWith(
                        fontSize: 44,
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
                      'Login Your Akun',
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
                      labelText: 'Username',
                      labelStyle: primaryTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    validator: (value) {
                      print(value);
                      if (value == '') {
                        return 'Username tidak boleh kosong';
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
                      print(value);
                      if (value == '') {
                        return 'Password tidak boleh kosong';
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
                  child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      child: SubmitButtonWidget(
                        title: 'SigIn',
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
