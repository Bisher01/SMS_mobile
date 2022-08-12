import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/providers/providers.dart';
import 'package:sms_mobile/screens/screens.dart';
import 'package:sms_mobile/utill/utill.dart';
import '../../models/models.dart';
import '../../services/api_response.dart';
import '../../components/error.dart' as err;

class QuestionsBankScreen extends StatefulWidget {
  final int classId;
  final int subjectId;
  final int type;
  final int season;
  final DateTime start;
  final DateTime end;
  const QuestionsBankScreen({
    Key? key,
    required this.start,
    required this.end,
    required this.season,
    required this.classId,
    required this.subjectId,
    required this.type,
  }) : super(key: key);

  @override
  State<QuestionsBankScreen> createState() => _QuestionsBankScreenState();
}

class _QuestionsBankScreenState extends State<QuestionsBankScreen> {
  List<Answer> answers = [];
  double totalMark = 0;
  List<AddQuestionToExam> questions = [];
  late final TextEditingController _markController;
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  int? id;
  @override
  initState() {
    _markController = TextEditingController();
    id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false)
        .getAllQuestions(id!, widget.classId, widget.subjectId, widget.type);
    super.initState();
  }

  @override
  dispose() {
    _markController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(251, 250, 250, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    days[DateTime.now().weekday - 1],
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'ChakraPetch',
                        letterSpacing: 0.5),
                  ),
                  Text(
                    '${months[DateTime.now().month - 1]} ${DateTime.now().year.toString().substring(2)}',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'ChakraPetch',
                        letterSpacing: 0.5),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                DateTime.now().day.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                    fontFamily: 'ChakraPetch'),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Consumer<AppProvider>(builder: (context, provider, child) {
        if (provider.questionBankResponse != null) {
          switch (provider.questionBankResponse!.status) {
            case Status.LOADING:
              return CircularProgressIndicator(
                color: Colors.orange[400],
              );
            case Status.COMPLETED:
              return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: provider.questionBankResponse!.data!.questions![0]
                      .questions!.length,
                  itemBuilder: (context, index) {
                    if (answers.length < index + 1) {
                      answers.add(Answer(
                        questionId: provider.questionBankResponse!.data!
                            .questions![0].questions![index].id,
                        choiceId: 0,
                      ));
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: AddQuestion(
                                          subject: widget.subjectId,
                                          classes: widget.classId,
                                          question: provider
                                              .questionBankResponse!
                                              .data!
                                              .questions![0]
                                              .questions![index],
                                        ),
                                        type: PageTransitionType.fade));
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                if (await provider.checkInternet()) {
                                  var response = await provider.deleteQuestion(
                                      provider.questionBankResponse!.data!
                                          .questions![0].questions![index].id!);
                                  if (response.status == Status.COMPLETED) {
                                    if (response.data != null &&
                                        response.data!.status!) {
                                      EasyLoading.showSuccess(
                                          response.data!.message!);
                                      provider.getAllQuestions(
                                        id!,
                                        widget.classId,
                                        widget.subjectId,
                                        widget.type,
                                      );
                                    }
                                  }
                                } else {
                                  EasyLoading.showError(
                                      'No Internet Connection');
                                }
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Question : ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Mark:  $totalMark/${provider.questionBankResponse!.data!.questions![0].max_mark}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    height: 30,
                                    child: TextField(
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      controller: _markController,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      onSubmitted: (String value) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.grey[400]),
                                        hintText: '__',
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0)),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0)),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          height: 15,
                          endIndent: 15,
                          indent: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20),
                          child: Text(
                            '${index + 1}. ${provider.questionBankResponse!.data!.questions![0].questions![index].text} ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                color: provider
                                            .questionBankResponse!
                                            .data!
                                            .questions![0]
                                            .questions![index]
                                            .choices![0]
                                            .status ==
                                        1
                                    ? Colors.orange[400]
                                    : const Color.fromRGBO(70, 73, 81, 1),
                              ),
                              constraints: BoxConstraints.expand(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 60,
                              ),
                              child: Center(
                                child: Text(
                                  provider
                                      .questionBankResponse!
                                      .data!
                                      .questions![0]
                                      .questions![index]
                                      .choices![0]
                                      .text!,
                                  style: TextStyle(
                                    color: provider
                                                .questionBankResponse!
                                                .data!
                                                .questions![0]
                                                .questions![index]
                                                .choices![0]
                                                .status ==
                                            1
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: provider
                                          .questionBankResponse!
                                          .data!
                                          .questions![0]
                                          .questions![index]
                                          .choices![0]
                                          .status ==
                                      1
                                  ? width - 85
                                  : 5,
                              top: 5,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: provider
                                                .questionBankResponse!
                                                .data!
                                                .questions![0]
                                                .questions![index]
                                                .choices![0]
                                                .status ==
                                            1
                                        ? const Color.fromRGBO(70, 73, 81, 1)
                                        : Colors.orange[400]),
                                child: Center(
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: provider
                                                  .questionBankResponse!
                                                  .data!
                                                  .questions![0]
                                                  .questions![index]
                                                  .choices![0]
                                                  .status ==
                                              1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                color: provider
                                            .questionBankResponse!
                                            .data!
                                            .questions![0]
                                            .questions![index]
                                            .choices![1]
                                            .status ==
                                        1
                                    ? Colors.orange[400]
                                    : const Color.fromRGBO(70, 73, 81, 1),
                              ),
                              constraints: BoxConstraints.expand(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 60,
                              ),
                              child: Center(
                                child: Text(
                                  provider
                                      .questionBankResponse!
                                      .data!
                                      .questions![0]
                                      .questions![index]
                                      .choices![1]
                                      .text!,
                                  style: TextStyle(
                                    color: provider
                                                .questionBankResponse!
                                                .data!
                                                .questions![0]
                                                .questions![index]
                                                .choices![1]
                                                .status ==
                                            1
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: provider
                                          .questionBankResponse!
                                          .data!
                                          .questions![0]
                                          .questions![index]
                                          .choices![1]
                                          .status ==
                                      1
                                  ? width - 85
                                  : 5,
                              top: 5,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: provider
                                                .questionBankResponse!
                                                .data!
                                                .questions![0]
                                                .questions![index]
                                                .choices![1]
                                                .status ==
                                            1
                                        ? const Color.fromRGBO(70, 73, 81, 1)
                                        : Colors.orange[400]),
                                child: Center(
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: provider
                                                  .questionBankResponse!
                                                  .data!
                                                  .questions![0]
                                                  .questions![index]
                                                  .choices![1]
                                                  .status ==
                                              1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: provider
                                      .questionBankResponse!
                                      .data!
                                      .questions![0]
                                      .questions![index]
                                      .choices!
                                      .length >
                                  2
                              ? 10
                              : 0,
                        ),
                        provider.questionBankResponse!.data!.questions![0]
                                    .questions![index].choices!.length >
                                2
                            ? Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      color: provider
                                                  .questionBankResponse!
                                                  .data!
                                                  .questions![0]
                                                  .questions![index]
                                                  .choices![2]
                                                  .status ==
                                              1
                                          ? Colors.orange[400]
                                          : const Color.fromRGBO(70, 73, 81, 1),
                                    ),
                                    constraints: BoxConstraints.expand(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 60,
                                    ),
                                    child: Center(
                                      child: Text(
                                        provider
                                            .questionBankResponse!
                                            .data!
                                            .questions![0]
                                            .questions![index]
                                            .choices![2]
                                            .text!,
                                        style: TextStyle(
                                          color: provider
                                                      .questionBankResponse!
                                                      .data!
                                                      .questions![0]
                                                      .questions![index]
                                                      .choices![2]
                                                      .status ==
                                                  1
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: provider
                                                .questionBankResponse!
                                                .data!
                                                .questions![0]
                                                .questions![index]
                                                .choices![2]
                                                .status ==
                                            1
                                        ? width - 85
                                        : 5,
                                    top: 5,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: provider
                                                      .questionBankResponse!
                                                      .data!
                                                      .questions![0]
                                                      .questions![index]
                                                      .choices![2]
                                                      .status ==
                                                  1
                                              ? const Color.fromRGBO(
                                                  70, 73, 81, 1)
                                              : Colors.orange[400]),
                                      child: Center(
                                        child: Text(
                                          'C',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: provider
                                                        .questionBankResponse!
                                                        .data!
                                                        .questions![0]
                                                        .questions![index]
                                                        .choices![2]
                                                        .status ==
                                                    1
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: provider
                                      .questionBankResponse!
                                      .data!
                                      .questions![0]
                                      .questions![index]
                                      .choices!
                                      .length >
                                  3
                              ? 10
                              : 0,
                        ),
                        provider.questionBankResponse!.data!.questions![0]
                                    .questions![index].choices!.length >
                                3
                            ? Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      color: provider
                                                  .questionBankResponse!
                                                  .data!
                                                  .questions![0]
                                                  .questions![index]
                                                  .choices![3]
                                                  .status ==
                                              1
                                          ? Colors.orange[400]
                                          : const Color.fromRGBO(70, 73, 81, 1),
                                    ),
                                    constraints: BoxConstraints.expand(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 60,
                                    ),
                                    child: Center(
                                      child: Text(
                                        provider
                                            .questionBankResponse!
                                            .data!
                                            .questions![0]
                                            .questions![index]
                                            .choices![3]
                                            .text!,
                                        style: TextStyle(
                                          color: provider
                                                      .questionBankResponse!
                                                      .data!
                                                      .questions![0]
                                                      .questions![index]
                                                      .choices![3]
                                                      .status ==
                                                  1
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: provider
                                                .questionBankResponse!
                                                .data!
                                                .questions![0]
                                                .questions![index]
                                                .choices![3]
                                                .status ==
                                            1
                                        ? width - 85
                                        : 5,
                                    top: 5,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: provider
                                                      .questionBankResponse!
                                                      .data!
                                                      .questions![0]
                                                      .questions![index]
                                                      .choices![3]
                                                      .status ==
                                                  1
                                              ? const Color.fromRGBO(
                                                  70, 73, 81, 1)
                                              : Colors.orange[400]),
                                      child: Center(
                                        child: Text(
                                          'D',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: provider
                                                        .questionBankResponse!
                                                        .data!
                                                        .questions![0]
                                                        .questions![index]
                                                        .choices![3]
                                                        .status ==
                                                    1
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: provider
                                      .questionBankResponse!
                                      .data!
                                      .questions![0]
                                      .questions![index]
                                      .choices!
                                      .length >
                                  4
                              ? 10
                              : 0,
                        ),
                        provider.questionBankResponse!.data!.questions![0]
                                    .questions![index].choices!.length >
                                4
                            ? Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      color: provider
                                                  .questionBankResponse!
                                                  .data!
                                                  .questions![0]
                                                  .questions![index]
                                                  .choices![4]
                                                  .status ==
                                              1
                                          ? Colors.orange[400]
                                          : const Color.fromRGBO(70, 73, 81, 1),
                                    ),
                                    constraints: BoxConstraints.expand(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 60,
                                    ),
                                    child: Center(
                                      child: Text(
                                        provider
                                            .questionBankResponse!
                                            .data!
                                            .questions![0]
                                            .questions![index]
                                            .choices![4]
                                            .text!,
                                        style: TextStyle(
                                          color: provider
                                                      .questionBankResponse!
                                                      .data!
                                                      .questions![0]
                                                      .questions![index]
                                                      .choices![4]
                                                      .status ==
                                                  1
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: provider
                                                .questionBankResponse!
                                                .data!
                                                .questions![0]
                                                .questions![index]
                                                .choices![4]
                                                .status ==
                                            1
                                        ? width - 85
                                        : 5,
                                    top: 5,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: provider
                                                      .questionBankResponse!
                                                      .data!
                                                      .questions![0]
                                                      .questions![index]
                                                      .choices![4]
                                                      .status ==
                                                  1
                                              ? const Color.fromRGBO(
                                                  70, 73, 81, 1)
                                              : Colors.orange[400]),
                                      child: Center(
                                        child: Text(
                                          'E',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: provider
                                                        .questionBankResponse!
                                                        .data!
                                                        .questions![0]
                                                        .questions![index]
                                                        .choices![4]
                                                        .status ==
                                                    1
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(),
                        Container(
                          margin: const EdgeInsets.only(top: 100),
                          width: widgetSize.getWidth(200, context),
                          height: widgetSize.getHeight(50, context),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(70, 73, 81, 1),
                              shadowColor: Colors.white70,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  24,
                                ),
                              ),
                            ),
                            onPressed: _markController.text.isEmpty
                                ? null
                                : () {
                                    double mark =
                                        double.parse(_markController.text);
                                    _markController.clear();
                                    questions.add(AddQuestionToExam(
                                        mark: mark.toInt(),
                                        questionId: provider
                                            .questionBankResponse!
                                            .data!
                                            .questions![0]
                                            .questions![index]
                                            .id));
                                    setState(() {
                                      totalMark = totalMark + mark;
                                    });
                                  },
                            child: const Text(
                              'ADD Question',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        index + 1 ==
                                provider.questionBankResponse!.data!
                                    .questions![0].questions!.length
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  top: 25,
                                ),
                                child: SizedBox(
                                  width: widgetSize.getWidth(150, context),
                                  height: widgetSize.getHeight(50, context),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.orange[400],
                                      shadowColor: Colors.white70,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          18,
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      AddExam addExam = AddExam(
                                          questions: questions,
                                          subjectId: widget.subjectId,
                                          classId: widget.classId,
                                          start: widget.start,
                                          end: widget.end,
                                          seasonId: widget.season,
                                          examNameId: widget.type);
                                      var response =
                                          await Provider.of<AppProvider>(
                                                  context,
                                                  listen: false)
                                              .addExam(addExam.toJson());
                                      if (await provider.checkInternet()) {
                                        if (response.status == Status.LOADING) {
                                          EasyLoading.showToast(
                                            'Loading...',
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                          );
                                        }
                                        if (response.status == Status.ERROR) {
                                          EasyLoading.showError(
                                              response.message!,
                                              dismissOnTap: true);
                                        }
                                        if (response.status ==
                                            Status.COMPLETED) {
                                          if (response.data != null &&
                                              response.data!.status!) {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'OK',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .orange[400],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    title: Text(
                                                      response.data!.message!,
                                                    ),
                                                    content: const Text(
                                                      'Your exam is added successfully',
                                                    ),
                                                  );
                                                });
                                          }
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    );
                  });
            case Status.ERROR:
              return err.Error(
                errorMsg: provider.questionBankResponse!.message!,
              );
            default:
              return Container();
          }
        }
        return Container();
      }),
    );
  }
}
