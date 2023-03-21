import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/loading_screen.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/screen/student/presence/presence_pratikum/presence_pratikum_view_model.dart';
import 'package:presence_kita/screen/student/presence/presence_view_model.dart';
import 'package:presence_kita/theme.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/submit_button_presence_widget.dart';

class LicenseePratikumPage extends StatelessWidget {
  const LicenseePratikumPage({super.key});

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
            'Surat Izin Atau Sakit',
            style: primaryTextStyle.copyWith(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Consumer<PresencePratikumViewModel>(
          builder: (context, value, child) {
            if (value.state == StatusState.loding) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Surat Izin Atau Sakit',
                    style: primaryTextStyle,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () async {
                        value.izin();
                      },
                      child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                value.fileName,
                                overflow: TextOverflow
                                    .ellipsis, // Menampilkan titik-titik (...) ketika teks terpotong
                                maxLines: 1,
                                style: primaryTextStyle.copyWith(
                                    color: Colors.grey),
                              ),
                              Icon(
                                Icons.attach_file,
                                size: 20,
                                color: Colors.grey.shade600,
                              )
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => value.submitIzin(context),
                      child: const SubmitButtonPresenceWidget(
                        title: 'IZIN',
                        color: pinkColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
