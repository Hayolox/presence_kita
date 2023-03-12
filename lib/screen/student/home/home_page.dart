import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/loading_screen.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/screen/student/home/home_view_model.dart';
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
                title: const Text('Surat Izin & Sakit'),
                onTap: () {
                  Navigator.pushNamed(context, '/permitPage');
                },
              ),
              ListTile(
                title: const Text('Kusioner'),
                onTap: () {
                  Navigator.pushNamed(context, '/question');
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
                                        context, '/sessionPage'),
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
                                            MainAxisAlignment.spaceAround,
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
                                                value.dataHome.subject[index]
                                                    .subject.nickname
                                                    .substring(0, 1),
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            value.dataHome.subject[index]
                                                .subject.nickname,
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
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
                          ),
                        )
                      ],
                    );
                  },
                ))));
  }
}
