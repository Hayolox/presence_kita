import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/loading_screen.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/screen/student/session/session_view_model.dart';
import 'package:presence_kita/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  String nameSubject = '';
  late int classroomsId;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<SessionViewModel>(context, listen: false);
      Map args = ModalRoute.of(context)!.settings.arguments as Map;

      nameSubject = args['name_subject'];
      classroomsId = args['classrooms_id'];
      await viewModel.getDataSession(classroomsId);
    });
  }

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
          'Session',
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<SessionViewModel>(
          builder: (context, value, child) {
            if (value.state == StatusState.loding) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  nameSubject,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              value.session.presence.toString(),
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Hadir',
                          style: primaryTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: pinkColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              value.session.permission.toString(),
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Izin',
                          style: primaryTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              value.session.alpha.toString(),
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Alpha',
                          style: primaryTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Session',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.session.sessions.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (value.session.statusSession[index] == 'hadir' ||
                              value.session.statusSession[index] == 'izin' ||
                              value.session.statusSession[index] == 'proses') {
                            if (value.session.statusSession[index] ==
                                'proses') {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'Info',
                                desc:
                                    'Surat Izin Menunggu Konfirmasi Staff Atau Dosen',
                                btnOkOnPress: () {},
                              ).show();
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'Info',
                                desc: 'Anda Sudah Melakukan Presensi',
                                btnOkOnPress: () {},
                              ).show();
                            }
                          } else {
                            value.presence(
                                value.session.sessions[index].id,
                                int.parse(
                                    value.session.sessions[index].classroomsId),
                                value.session.sessions[index].date,
                                value.session.sessions[index].finish,
                                {
                                  'lecturer': value.session.sessions[index]
                                      .lecturer.fullName,
                                  'session_id':
                                      value.session.sessions[index].id,
                                  'classroomsId': value
                                      .session.sessions[index].classroomsId,
                                  'start': value.session.sessions[index].start,
                                  'finish':
                                      value.session.sessions[index].finish,
                                  'geolocation':
                                      value.session.sessions[index].geolocation,
                                  'latitude': value
                                      .session.sessions[index].room.latitude,
                                  'longitude': value
                                      .session.sessions[index].room.longitude,
                                },
                                context);
                          }
                        },
                        child: Container(
                          height: 105,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 19, horizontal: 20),
                          margin: const EdgeInsets.only(bottom: 18),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value.session.sessions[index].title,
                                    style: primaryTextStyle,
                                  ),
                                  Text(
                                    value.session.sessions[index].start,
                                    style: primaryTextStyle,
                                  ),
                                ],
                              ),
                              Text(
                                '${value.session.sessions[index].date.day}-${value.session.sessions[index].date.month}-${value.session.sessions[index].date.year}',
                                style: primaryTextStyle,
                              ),
                              Text(
                                value.now.day >
                                        value.session.sessions[index].date.day
                                    ? "Anda Alpa"
                                    : value.now.month >
                                            value.session.sessions[index].date
                                                .month
                                        ? "Anda Alpa"
                                        : value.now.year >
                                                value.session.sessions[index]
                                                    .date.year
                                            ? 'Anda Alpa'
                                            : value.session
                                                        .statusSession[index] ==
                                                    "none"
                                                ? "Anda Belum Melakukan Presensi"
                                                : value.session.statusSession[
                                                            index] ==
                                                        "hadir"
                                                    ? "Anda Hadir"
                                                    : value.session.statusSession[
                                                                index] ==
                                                            "proses"
                                                        ? "Menunggu Konfirmasi Staff Atau Dosen"
                                                        : "Anda Izin",
                                style: primaryTextStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
