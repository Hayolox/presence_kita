import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/loading_screen.dart';
import 'package:presence_kita/common/widgets/submit_button_presence_widget.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/screen/student/session/session_view_model.dart';
import 'package:presence_kita/theme.dart';
import 'package:provider/provider.dart';

class PresencePage extends StatefulWidget {
  const PresencePage({super.key});

  @override
  State<PresencePage> createState() => _PresencePageState();
}

class _PresencePageState extends State<PresencePage> {
  String nameLecturer = '';
  String start = '';
  String finish = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<SessionViewModel>(context, listen: false);
      Map args = ModalRoute.of(context)!.settings.arguments as Map;
      print(args['lecturer']);
      nameLecturer = args['lecturer'];
      start = args['start'];
      finish = args['finish'];
      viewModel.loadingPresence();
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
                    nameLecturer,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Text(
                    'Batas Presensi Masuk : $start',
                    style: primaryTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Batas Presensi Keluar : $finish',
                    style: primaryTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: const SubmitButtonPresenceWidget(
                          title: 'Masuk',
                          color: purpleColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/licensePage'),
                        child: const SubmitButtonPresenceWidget(
                          title: 'Izin',
                          color: pinkColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/sickPage'),
                        child: const SubmitButtonPresenceWidget(
                          title: 'Sakit',
                          color: redColor,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
