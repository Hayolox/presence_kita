import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/loading_screen.dart';
import 'package:presence_kita/common/widgets/submit_button_presence_widget.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/screen/student/presence/presence_pratikum/presence_pratikum_view_model.dart';
import 'package:presence_kita/screen/student/presence/presence_view_model.dart';
import 'package:presence_kita/theme.dart';
import 'package:provider/provider.dart';

class PresencePratikumPage extends StatefulWidget {
  const PresencePratikumPage({super.key});

  @override
  State<PresencePratikumPage> createState() => _PresencePratikumPageState();
}

class _PresencePratikumPageState extends State<PresencePratikumPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel =
          Provider.of<PresencePratikumViewModel>(context, listen: false);
      Map args = ModalRoute.of(context)!.settings.arguments as Map;

      viewModel.loadingPresence(
          args['lecturer'],
          args['classroomsId'],
          args['session_id'],
          args['start'],
          args['finish'],
          args['geolocation'],
          double.parse(args['latitude']),
          double.parse(args['longitude']));
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
          'Presence Pratikum',
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
          child: Consumer<PresencePratikumViewModel>(
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
                    value.nameLecturer,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Text(
                    'Masuk : ${value.start}',
                    style: primaryTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Keluar : ${value.finish}',
                    style: primaryTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, '/licensePratikumPage'),
                        child: const SubmitButtonPresenceWidget(
                          title: 'Izin',
                          color: pinkColor,
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
