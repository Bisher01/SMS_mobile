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
    int id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false).getTeacherSubjects(id);
    super.initState();
  }

  //int selectedSubject = 0;
  int selectedClass = 0;
  int subjectId = 0;
  int classId = 0;
  int? selectedSeason;
  int? examDDV = 1;
  List<ExamTypes> examTypes = [
    ExamTypes(
      type: 'First',
      id: 1,
    ),
    ExamTypes(
      type: 'Second',
      id: 2,
    ),
    ExamTypes(
      type: 'Mid',
      id: 3,
    ),
    ExamTypes(
      type: 'Finals',
      id: 4,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Teacher's classes",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //exam type
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Select exam type:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      DropdownButton<int>(
                          hint: const Text(
                            'Exam type',
                          ),
                          value: examDDV,
                          elevation: 16,
                          underline: Container(
                            height: 2,
                            color: Colors.orange[400],
                          ),
                          onChanged: (int? newValue) {
                            setState(() {
                              examDDV = newValue ?? 0;
                            });
                          },
                          items: examTypes.map((e) {
                            return DropdownMenuItem<int>(
                              value: e.id!,
                              child: Text(e.type!),
                            );
                          }).toList()),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Select season:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      DropdownButton<int>(
                          hint: const Text(
                            'Season',
                          ),
                          value: selectedSeason,
                          elevation: 16,
                          underline: Container(
                            height: 2,
                            color: Colors.orange[400],
                          ),
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedSeason = newValue ?? 1;
                            });
                          },
                          items: [1,2].map((e) {
                            return DropdownMenuItem<int>(
                              value: e,
                              child: Text(e.toString()),
                            );
                          }).toList()),
                    ],
                  ),
                ],
              ),
            ),
            Consumer<AppProvider>(
              builder: (context, provider, child) {
                if (provider.getTeacherSubjectsResponse != null) {
                  switch (provider.getTeacherSubjectsResponse!.status) {
                    case Status.LOADING:
                      return CircularProgressIndicator(
                        color: Colors.orange[400],
                      );
                    case Status.COMPLETED:
                      {
                        return SizedBox(
                          height: widgetSize.getHeight(
                            350,
                            context,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Flexible(
                              //   fit: FlexFit.tight,
                              //   child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       const Padding(
                              //         padding: EdgeInsets.only(
                              //           bottom: 20,
                              //         ),
                              //         child: Text(
                              //           'Select subject: ',
                              //           style: TextStyle(
                              //             fontSize: 18,
                              //             fontWeight: FontWeight.w600,
                              //           ),
                              //         ),
                              //       ),
                              //       Flexible(
                              //         fit: FlexFit.loose,
                              //         child: ListWheelScrollView(
                              //           onSelectedItemChanged: (index) {
                              //             setState(() {
                              //               selectedSubject = index;
                              //             });
                              //             subjectId = provider
                              //                 .getTeacherSubjectsResponse!
                              //                 .data!
                              //                 .data![index]
                              //                 .id!;
                              //           },
                              //           clipBehavior: Clip.antiAlias,
                              //           controller: fixedExtentScrollController,
                              //           physics: const FixedExtentScrollPhysics(),
                              //           perspective: 0.005,
                              //           offAxisFraction: -0.0,
                              //           diameterRatio: 2,
                              //           itemExtent: 60,
                              //           children: provider
                              //               .getTeacherSubjectsResponse!
                              //               .data!
                              //               .data!
                              //               .map((e) {
                              //             return Row(
                              //               children: <Widget>[
                              //                 Expanded(
                              //                   child: Container(
                              //                     decoration: BoxDecoration(
                              //                       color: Colors.white70,
                              //                       border: Border.all(
                              //                           color: Colors.orange),
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                         12,
                              //                       ),
                              //                     ),
                              //                     child: Padding(
                              //                       padding: const EdgeInsets.all(
                              //                         16.0,
                              //                       ),
                              //                       child: Text(
                              //                         e.name!,
                              //                         textAlign: TextAlign.center,
                              //                         style: TextStyle(
                              //                             fontSize: 18.0,
                              //                             color:
                              //                                 Colors.orange[400]),
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ],
                              //             );
                              //           }).toList(),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // const SizedBox(
                              //   width: 20,
                              // ),
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
                                              .data![0]
                                              .class_classroom![index]
                                              .classes!
                                              .id!;
                                        },
                                        clipBehavior: Clip.antiAlias,
                                        controller: fixedExtentScrollController,
                                        physics:
                                            const FixedExtentScrollPhysics(),
                                        perspective: 0.005,
                                        offAxisFraction: -0.0,
                                        diameterRatio: 2,
                                        itemExtent: 60,
                                        children: provider
                                            .getTeacherSubjectsResponse!
                                            .data!
                                            .data![0]
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                      16.0,
                                                    ),
                                                    child: Text(
                                                      e.classes!.name!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors
                                                              .orange[400]),
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
                      }

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
                onPressed: () {
                  subjectId = Provider.of<AppProvider>(context, listen: false)
                      .getTeacherSubjectsResponse!
                      .data!
                      .data![0]
                      .id!;
                  classId = classId == 0
                      ? Provider.of<AppProvider>(context, listen: false)
                          .getTeacherSubjectsResponse!
                          .data!
                          .data![0]
                          .class_classroom![0]
                          .class_id!
                      : classId;
                  Navigator.push(
                    context,
                    PageTransition(
                      child: QuestionsBankScreen(
                        season: selectedSeason!,
                        classId: classId,
                        subjectId: subjectId,
                        type: examDDV!,
                      ),
                      type: PageTransitionType.leftToRightPop,
                      childCurrent: widget,
                      duration: const Duration(milliseconds: 400),
                    ),
                  );
                },
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
                  subjectId = Provider.of<AppProvider>(context, listen: false)
                      .getTeacherSubjectsResponse!
                      .data!
                      .data![0]
                      .id!;
                  classId = classId == 0
                      ? Provider.of<AppProvider>(context, listen: false)
                          .getTeacherSubjectsResponse!
                          .data!
                          .data![0]
                          .class_classroom![0]
                          .class_id!
                      : classId;
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

class ExamTypes {
  int? id;
  String? type;
  ExamTypes({
    this.type,
    this.id,
  });
}
