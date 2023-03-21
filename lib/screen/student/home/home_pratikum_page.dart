import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/loading_screen.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/screen/student/home/home_view_model.dart';
import 'package:presence_kita/screen/student/presence/presence_pratikum/presence_pratikum_view_model.dart';
import 'package:presence_kita/screen/student/presence/presence_view_model.dart';
import 'package:presence_kita/theme.dart';
import 'package:provider/provider.dart';

class HomePratikumPage extends StatefulWidget {
  const HomePratikumPage({super.key});

  @override
  State<HomePratikumPage> createState() => _HomePratikumPageState();
}

class _HomePratikumPageState extends State<HomePratikumPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<HomeViewModel>(context, listen: false);
      await viewModel.getDataHome();
      if (viewModel.dataHome.sus == 1) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/question');
      }
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
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              onPressed: () async {
                var viewModel = Provider.of<PresencePratikumViewModel>(context,
                    listen: false);
                await viewModel.present(context);
              },
            ),
          ],
          title: Text(
            'Attendity',
            style: primaryTextStyle.copyWith(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<HomeViewModel>(
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
                          value.student[1],
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          value.student[2],
                          style: primaryTextStyle.copyWith(
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Text(
                          'Pratikum Kamu',
                          style: primaryTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () => value.getDataHome(),
                            child: ListView.builder(
                              itemCount: value.dataHome.pratikum.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/sessionPratikumPage',
                                        arguments: {
                                          'classrooms_id': value
                                              .dataHome
                                              .pratikum[index]
                                              .classroompratikum
                                              .id,
                                          'name_subject': value
                                              .dataHome
                                              .pratikum[index]
                                              .classroompratikum
                                              .subject
                                              .fullName
                                        }),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffAEC8E7),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Center(
                                              child: Text(
                                                value
                                                    .dataHome
                                                    .pratikum[index]
                                                    .classroompratikum
                                                    .subject
                                                    .nickname
                                                    .substring(0, 1),
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            '${value.dataHome.pratikum[index].classroompratikum.subject.nickname} ${value.dataHome.pratikum[index].classroompratikum.name}',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ))));
  }
}
