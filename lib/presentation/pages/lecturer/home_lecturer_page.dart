import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:presence_kita/theme.dart';

class HomeLecturerPage extends StatelessWidget {
  const HomeLecturerPage({super.key});

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
            'Attendity',
            style: primaryTextStyle.copyWith(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xffD9D9D9),
          child: ListView(
            padding: const EdgeInsets.only(top: 40),
            children: [
              ListTile(
                title: const Text('Ubah Password'),
                onTap: () {
                  Navigator.pushNamed(context, '/changePasswordPage');
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/signInLecturerPage', (route) => false),
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              Text(
                'Matkul Yang Diajarkan',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'Mata Kuliah Kamu',
                style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, '/sessionLecturerPage'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          height: 77,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xffAEC8E7),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Text(
                                    'M',
                                    style: primaryTextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Pemweb I',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '30',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Icon(Icons.people)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )));
  }
}
