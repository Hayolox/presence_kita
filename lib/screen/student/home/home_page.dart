import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/loading_screen.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/screen/student/home/home_view_model.dart';
import 'package:presence_kita/screen/student/presence/presence_view_model.dart';
import 'package:presence_kita/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                var viewModel =
                    Provider.of<PresenceViewModel>(context, listen: false);
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
        drawer: Drawer(
          backgroundColor: const Color(0xffD9D9D9),
          child: ListView(
            padding: const EdgeInsets.only(top: 40),
            children: [
              ListTile(
                title: const Text('Pratikum'),
                onTap: () {
                  Navigator.pushNamed(context, '/homePratikumPage');
                },
              ),
              ListTile(
                title: const Text('Ubah Password'),
                onTap: () {
                  Navigator.pushNamed(context, '/changePasswordPage');
                },
              ),
            ],
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
                          child: RefreshIndicator(
                            onRefresh: () => value.getDataHome(),
                            child: ListView.builder(
                              itemCount: value.dataHome.subject.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/sessionPage',
                                        arguments: {
                                          'classrooms_id': value.dataHome
                                              .subject[index].classroom.id,
                                          'name_subject': value
                                              .dataHome
                                              .subject[index]
                                              .classroom
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              '${value.dataHome.subject[index].classroom.subject.nickname} ${value.dataHome.subject[index].classroom.name}',
                                              style: primaryTextStyle.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.people),
                                                Text(
                                                  value
                                                      .dataHome
                                                      .countStudentInSubject[
                                                          index]
                                                      .toString(),
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
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
