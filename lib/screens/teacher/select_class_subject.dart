import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../screens.dart';
import '../../components/error.dart' as err;

class SelectClassSubject extends StatefulWidget {
  const SelectClassSubject({Key? key}) : super(key: key);

  @override
  State<SelectClassSubject> createState() => _SelectClassSubjectState();
}

class _SelectClassSubjectState extends State<SelectClassSubject> {
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();

  @override
  initState() {
    Provider.of<AppProvider>(context, listen: false).getTeacherSubjects(1);
    super.initState();
  }

  int selectedSubject = 0;
  int selectedClass = 0;
  int subjectId = 0;
  int classId = 0;
  int examId = 0;
  String? examDDV;
  List<String> examTypes = ['First', 'Second', 'Mid', 'Finals'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Teacher's classes and subjects",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTopJoined,
                childCurrent: widget,
                duration: const Duration(milliseconds: 300),
                child: const TeacherMainScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Column(
                children: [
                  const Text(
                    'Select exam type:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  DropdownButton<String>(
                      hint: const Text(
                        'Exam type',
                      ),
                      value: examDDV,
                      elevation: 16,
                      underline: Container(
                        height: 2,
                        color: Colors.orange[400],
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          examDDV = newValue ?? 'Exam type';
                        });
                      },
                      items: examTypes.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList()),
                ],
              ),
            ),
            Consumer<AppProvider>(
              builder: (context, provider, child) {
                print(provider.getTeacherSubjectsResponse!.data!.data![0].name);
                if (provider.getTeacherSubjectsResponse != null) {
                  switch (provider.getTeacherSubjectsResponse!.status) {
                    case Status.LOADING:
                      return CircularProgressIndicator(
                        color: Colors.orange[400],
                      );
                    case Status.COMPLETED:
                      return SizedBox(
                        height: widgetSize.getHeight(
                          350,
                          context,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 20,
                                    ),
                                    child: Text(
                                      'Select subject: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: ListWheelScrollView(
                                      onSelectedItemChanged: (index) {
                                        setState(() {
                                          selectedSubject = index;
                                        });
                                        subjectId = provider
                                            .getTeacherSubjectsResponse!
                                            .data!
                                            .data![index]
                                            .id!;
                                      },
                                      clipBehavior: Clip.antiAlias,
                                      controller: fixedExtentScrollController,
                                      physics: const FixedExtentScrollPhysics(),
                                      perspective: 0.005,
                                      offAxisFraction: -0.0,
                                      diameterRatio: 2,
                                      itemExtent: 60,
                                      children: provider
                                          .getTeacherSubjectsResponse!
                                          .data!
                                          .data!
                                          .map((e) {
                                        return Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  border: Border.all(
                                                      color: Colors.orange),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    12,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    16.0,
                                                  ),
                                                  child: Text(
                                                    e.name!,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color:
                                                            Colors.orange[400]),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 20,
                                    ),
                                    child: Text(
                                      'Select class: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: ListWheelScrollView(
                                      onSelectedItemChanged: (index) {
                                        setState(() {
                                          selectedClass = index;
                                        });
                                        classId = provider
                                            .getTeacherSubjectsResponse!
                                            .data!
                                            .data![selectedSubject]
                                            .class_classroom![index]
                                            .classes!
                                            .id!;
                                      },
                                      clipBehavior: Clip.antiAlias,
                                      controller: fixedExtentScrollController,
                                      physics: const FixedExtentScrollPhysics(),
                                      perspective: 0.005,
                                      offAxisFraction: -0.0,
                                      diameterRatio: 2,
                                      itemExtent: 60,
                                      children: provider
                                          .getTeacherSubjectsResponse!
                                          .data!
                                          .data![selectedSubject]
                                          .class_classroom!
                                          .map((e) {
                                        return Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  border: Border.all(
                                                      color: Colors.orange),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    12,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    16.0,
                                                  ),
                                                  child: Text(
                                                    e.classrooms!.name!,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        color:
                                                            Colors.orange[400]),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    case Status.ERROR:
                      return err.Error(
                        errorMsg: provider.getStudentExamResponse!.message!,
                      );
                    default:
                      return Container();
                  }
                }
                return Container();
              },
            ),
            SizedBox(
              height: widgetSize.getHeight(50, context),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  primary: Colors.orange[400],
                  shadowColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'add a new exam from bank',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: widgetSize.getHeight(50, context),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  primary: Colors.orange[400],
                  shadowColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: AddQuestion(
                        classes: classId,
                        subject: subjectId,
                      ),
                      type: PageTransitionType.leftToRightPop,
                      childCurrent: widget,
                      duration: const Duration(milliseconds: 400),
                    ),
                  );
                },
                child: const Text(
                  'add a new question to bank',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
