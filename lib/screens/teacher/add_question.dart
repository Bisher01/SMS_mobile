import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/models/add_question.dart';
import 'package:sms_mobile/providers/providers.dart';
import 'package:sms_mobile/utill/utill.dart';
import '../../models/models.dart';

class AddQuestion extends StatefulWidget {
  final int classes;
  final int subject;
  const AddQuestion({required this.classes, required this.subject, Key? key})
      : super(key: key);

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(251, 250, 250, 1),
          elevation: 0,
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
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(70, 73, 81, 1),
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
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(70, 73, 81, 1)),
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
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Color.fromRGBO(70, 73, 81, 1)),
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
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Color.fromRGBO(70, 73, 81, 1)),
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
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(70, 73, 81, 1),
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
                    width: widgetSize.getWidth(170, context),
                    height: widgetSize.getHeight(45, context),
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
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
                          'Choices',
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
                    width: widgetSize.getWidth(170, context),
                    height: widgetSize.getHeight(45, context),
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        AddQuestionModel question = AddQuestionModel(
                          teacherId:
                              Provider.of<AppProvider>(context, listen: false)
                                  .getId()
                                  .toString(),
                          classId: widget.classes.toString(),
                          subjectId: widget.subject.toString(),
                          question: [
                            Question(text: _questionController.text,
                                choices: [
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
                            ]),
                          ],
                        );
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
