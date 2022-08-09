import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/models/models.dart';
import 'package:sms_mobile/providers/providers.dart';
import 'package:sms_mobile/screens/screens.dart';
import 'package:sms_mobile/utill/utill.dart';
import '../../models/models.dart';
import '../../services/api_response.dart';

class AddQuestion extends StatefulWidget {
  final int classes;
  final int subject;
  Questions? question;
  bool isEditing;
  AddQuestion(
      {required this.classes, required this.subject, Key? key, this.question})
      : isEditing = (question != null),
        super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  int numOfChoices = 2;
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _choice1Controller = TextEditingController();
  final TextEditingController _choice2Controller = TextEditingController();
  final TextEditingController _choice3Controller = TextEditingController();
  final TextEditingController _choice4Controller = TextEditingController();
  final TextEditingController _choice5Controller = TextEditingController();
  late final FocusNode _questionFocusNode;
  late final FocusNode _choice1FocusNode;
  late final FocusNode _choice2FocusNode;
  late final FocusNode _choice3FocusNode;
  late final FocusNode _choice4FocusNode;
  late final FocusNode _choice5FocusNode;
  List<Choice> choice = [];
  int selected = 0;
  @override
  void initState() {
    if (widget.isEditing) {
      numOfChoices = widget.question!.choices!.length;
      _questionController.text = widget.question!.text!;
      _choice1Controller.text = widget.question!.choices![0].text!;
      _choice2Controller.text = widget.question!.choices![1].text!;
      if (numOfChoices > 2) {
        _choice3Controller.text = widget.question!.choices![2].text!;
      }
      if (numOfChoices > 3) {
        _choice4Controller.text = widget.question!.choices![3].text!;
      }
      if (numOfChoices > 4) {
        _choice5Controller.text = widget.question!.choices![4].text!;
      }
      for (int i = 0; i < numOfChoices; i++) {
        if (widget.question!.choices![i].status == 1) {
          selected = i + 1;
        }
      }
    }
    _questionFocusNode = FocusNode();
    _choice1FocusNode = FocusNode();
    _choice2FocusNode = FocusNode();
    _choice3FocusNode = FocusNode();
    _choice4FocusNode = FocusNode();
    _choice5FocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add a new question",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Text(
                        'Add Question',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Colors.grey,
                        ),
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
                        horizontal: 15.0,
                        vertical: 20,
                      ),
                      child: TextField(
                        controller: _questionController,
                        focusNode: _questionFocusNode,
                        textDirection: TextDirection.ltr,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: 'Enter question',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: TextField(
                        controller: _choice1Controller,
                        focusNode: _choice1FocusNode,
                        textDirection: TextDirection.ltr,
                        maxLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                              left: 8,
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selected = 1;
                                });
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selected == 1
                                      ? Colors.orange[400]
                                      : const Color.fromRGBO(70, 73, 81, 1),
                                ),
                                child: const Center(
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          hintText: 'Enter first choice',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: TextField(
                        controller: _choice2Controller,
                        focusNode: _choice2FocusNode,
                        textDirection: TextDirection.ltr,
                        maxLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                              left: 8,
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selected = 2;
                                });
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selected == 2
                                        ? Colors.orange[400]
                                        : const Color.fromRGBO(
                                            70, 73, 81, 1)),
                                child: const Center(
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          hintText: 'Enter second choice',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    numOfChoices > 2
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: TextField(
                              controller: _choice3Controller,
                              focusNode: _choice3FocusNode,
                              textDirection: TextDirection.ltr,
                              maxLines: 1,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = 3;
                                      });
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selected == 3
                                              ? Colors.orange[400]
                                              : const Color.fromRGBO(
                                                  70, 73, 81, 1)),
                                      child: const Center(
                                        child: Text(
                                          'C',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                hintText: 'Enter third choice',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 1,
                          ),
                    numOfChoices > 3
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 15,
                            ),
                            child: TextField(
                              controller: _choice4Controller,
                              focusNode: _choice4FocusNode,
                              textDirection: TextDirection.ltr,
                              maxLines: 1,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = 4;
                                      });
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selected == 4
                                              ? Colors.orange[400]
                                              : const Color.fromRGBO(
                                                  70, 73, 81, 1)),
                                      child: const Center(
                                        child: Text(
                                          'D',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                hintText: 'Enter fourth choice',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 1,
                          ),
                    numOfChoices > 4
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 15,
                            ),
                            child: TextField(
                              controller: _choice5Controller,
                              focusNode: _choice5FocusNode,
                              textDirection: TextDirection.ltr,
                              maxLines: 1,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = 5;
                                      });
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selected == 5
                                            ? Colors.orange[400]
                                            : const Color.fromRGBO(
                                                70, 73, 81, 1),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'E',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                hintText: 'Enter fifth choice',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 1,
                          ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: widgetSize.getWidth(180, context),
                  height: widgetSize.getHeight(50, context),
                  decoration: BoxDecoration(
                    color: Colors.orange[400],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onTap: () {
                          if (numOfChoices > 2) {
                            setState(() {
                              numOfChoices--;
                            });
                          }
                        },
                      ),
                      const Text(
                        'Choice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      InkWell(
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onTap: () {
                          if (numOfChoices < 5) {
                            setState(() {
                              numOfChoices++;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: widgetSize.getWidth(180, context),
                  height: widgetSize.getHeight(50, context),
                  decoration: BoxDecoration(
                    color: Colors.orange[400],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: InkWell(
                    onTap: () async {
                      if (widget.isEditing) {
                        List<EditQuestionChoices> choices = [
                          EditQuestionChoices(
                              text: _choice1Controller.text,
                              status: selected == 1 ? 1 : 0,
                              id: widget.question!.choices![0].id),
                          EditQuestionChoices(
                              text: _choice2Controller.text,
                              status: selected == 2 ? 1 : 0,
                              id: widget.question!.choices![1].id),
                          if (numOfChoices > 2)
                            EditQuestionChoices(
                                text: _choice3Controller.text,
                                status: selected == 3 ? 1 : 0,
                                id: widget.question!.choices![2].id),
                          if (numOfChoices > 3)
                            EditQuestionChoices(
                                text: _choice4Controller.text,
                                status: selected == 4 ? 1 : 0,
                                id: widget.question!.choices![3].id),
                          if (numOfChoices > 4)
                            EditQuestionChoices(
                                text: _choice5Controller.text,
                                status: selected == 5 ? 1 : 0,
                                id: widget.question!.choices![4].id),
                        ];
                        EditQuestionModel question = EditQuestionModel(
                          text: _questionController.text,
                          choices: choices,
                          method: 'PUT',
                        );
                        var provider =
                            Provider.of<AppProvider>(context, listen: false);
                        if (await provider.checkInternet()) {
                          var response = await Provider.of<AppProvider>(
                                  context,
                                  listen: false)
                              .editQuestion(
                                  widget.question!.id!, question.toJson());
                          if (response.status == Status.LOADING) {
                            EasyLoading.showToast(
                              'Loading...',
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                            );
                          }
                          if (response.status == Status.ERROR) {
                            EasyLoading.showError(response.message!,
                                dismissOnTap: true);
                          }
                          if (response.status == Status.COMPLETED) {
                            if (response.data != null &&
                                response.data!.status!) {
                              EasyLoading.showSuccess(response.data!.message!,
                                  dismissOnTap: true,
                                  duration: const Duration(seconds: 1));
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.pop(context);
                              });
                            }
                          }
                        } else {
                          EasyLoading.showError('No Internet Connection');
                        }
                      }
                      if (!widget.isEditing) {
                        List<Choice> choices = [
                          Choice(
                            text: _choice1Controller.text,
                            status: selected == 1 ? 1 : 0,
                          ),
                          Choice(
                            text: _choice2Controller.text,
                            status: selected == 2 ? 1 : 0,
                          ),
                          if (numOfChoices > 2)
                            Choice(
                              text: _choice3Controller.text,
                              status: selected == 3 ? 1 : 0,
                            ),
                          if (numOfChoices > 3)
                            Choice(
                              text: _choice4Controller.text,
                              status: selected == 4 ? 1 : 0,
                            ),
                          if (numOfChoices > 4)
                            Choice(
                              text: _choice5Controller.text,
                              status: selected == 5 ? 1 : 0,
                            ),
                        ];
                        List<Question> question = [
                          Question(
                            text: _questionController.text,
                            chioces: choices,
                          ),
                        ];
                        AddQuestionModel addQuestion = AddQuestionModel(
                          teacherId:
                              Provider.of<AppProvider>(context, listen: false)
                                  .getId()
                                  .toString(),
                          classId: widget.classes.toString(),
                          subjectId: widget.subject.toString(),
                          question: question,
                        );
                        var provider =
                            Provider.of<AppProvider>(context, listen: false);
                        if (await provider.checkInternet()) {
                          var response = await Provider.of<AppProvider>(
                                  context,
                                  listen: false)
                              .addExamQuestion(addQuestion.toJson());
                          if (response.status == Status.LOADING) {
                            EasyLoading.showToast(
                              'Loading...',
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                            );
                          }
                          if (response.status == Status.ERROR) {
                            EasyLoading.showError(response.message!,
                                dismissOnTap: true);
                          }
                          if (response.status == Status.COMPLETED) {
                            if (response.data != null &&
                                response.data!.status!) {
                              EasyLoading.showSuccess(response.data!.message!,
                                  dismissOnTap: true);
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: AddQuestion(
                                    classes: widget.classes,
                                    subject: widget.subject,
                                  ),
                                  type: PageTransitionType.bottomToTopJoined,
                                  childCurrent: widget,
                                  duration: const Duration(milliseconds: 300),
                                ),
                              );
                            }
                          }
                        } else {
                          EasyLoading.showError('No Internet Connection');
                        }
                      }
                    },
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _questionFocusNode.dispose();
    _choice1FocusNode.dispose();
    _choice2FocusNode.dispose();
    _choice3FocusNode.dispose();
    _choice4FocusNode.dispose();
    _choice5FocusNode.dispose();
    super.dispose();
  }
}
