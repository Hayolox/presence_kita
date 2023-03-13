import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:presence_kita/common/widgets/loading_screen.dart';
import 'package:presence_kita/common/widgets/submit_button_widget.dart';
import 'package:presence_kita/constant/state.dart';
import 'package:presence_kita/screen/drawer/sus_view_model.dart';
import 'package:presence_kita/theme.dart';
import 'package:provider/provider.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<SusViewModel>(context, listen: false);
      await viewModel.getQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(child: Consumer<SusViewModel>(
          builder: (context, value, child) {
            if (value.state == StatusState.loding) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 136,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        value.susQuestion[value.currentIndex],
                        style: primaryTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 20,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => value.changeAnswer(index),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 2),
                            child: Text(
                              '${index + 1}',
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  color: value.currentIndex ==
                                          value.question[index]
                                      ? Colors.grey
                                      : Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Jawab',
                    style: primaryTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.choiceAnswer.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => value.chooseAnswer(index + 1),
                          child: Container(
                            height: 51,
                            margin: const EdgeInsets.only(bottom: 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  value.answerStudent[value.intCurrentIndex] ==
                                          index + 1
                                      ? Colors.green
                                      : const Color(0xffE5E5E5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(value.choiceAnswer[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (value.intCurrentIndex == 9) ...[
                    GestureDetector(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.rightSlide,
                          title: 'INFO',
                          desc: 'Apakah Anda Yakin Dengan Jawaban Anda?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            value.submit(context);
                          },
                        ).show();
                      },
                      child: const Center(
                          child: SubmitButtonWidget(title: 'Selesai')),
                    )
                  ]
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}
