import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/screens/teacher/add_quiz.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../screens.dart';
import '../../components/error.dart' as err;

class SelectClassSubjectClassroom extends StatefulWidget {
  final bool addOralMark;
  const SelectClassSubjectClassroom({required this.addOralMark, Key? key})
      : super(key: key);

  @override
  State<SelectClassSubjectClassroom> createState() =>
      _SelectClassSubjectClassroomState();
}

class _SelectClassSubjectClassroomState
    extends State<SelectClassSubjectClassroom> {
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();

  Map<int, int> subjects = {};
  late final FocusNode _focusNode;
  final TextEditingController _controller = TextEditingController();
  @override
  initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    int id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false).getTeacherSubjects(id);
    super.initState();
  }

  int? selectedSubject = 0;
  int selectedClass = 0;
  int selectedClassroom = 0;
  int selectedSeason = 1;
  int classId = 0;
  int classroomId = 0;
  int? subjectDDV;

  DateTime _startDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  void _presentDatePicker(DateTime date) {
    showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.orange[400],
            colorScheme: ColorScheme.light(primary: Colors.orange[400]!),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _startDate = pickedDate;
      });
    });
  }

  void _presentStartTimePicker(TimeOfDay start) {
    showTimePicker(
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: Colors.orange[400],
                  colorScheme: ColorScheme.light(primary: Colors.orange[400]!),
                  buttonTheme:
                      const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                ),
                child: child!,
              );
            },
            context: context,
            initialTime: start)
        .then((pickedTime) {
      if (pickedTime == null) {
        return;
      } else {
        setState(() {
          _startTime = pickedTime;
        });
      }
    });
  }

  void _presentEndTimePicker(TimeOfDay end) {
    showTimePicker(
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: Colors.orange[400],
                  colorScheme: ColorScheme.light(primary: Colors.orange[400]!),
                  buttonTheme:
                      const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                ),
                child: child!,
              );
            },
            context: context,
            initialTime: end)
        .then((pickedTime) {
      if (pickedTime == null) {
        return;
      } else {
        setState(() {
          _endTime = pickedTime;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Teacher's classes and classrooms",
          style: TextStyle(fontSize: 16, color: Colors.black),
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
        child: Consumer<AppProvider>(
          builder: (context, provider, child) {
            if (provider.getTeacherSubjectsResponse != null) {
              switch (provider.getTeacherSubjectsResponse!.status) {
                case Status.LOADING:
                  return CircularProgressIndicator(
                    color: Colors.orange[400],
                  );
                case Status.COMPLETED:
                  {
                    for (int i = 0;
                        i <
                            provider
                                .getTeacherSubjectsResponse!.data!.data!.length;
                        i++) {
                      subjects[provider
                          .getTeacherSubjectsResponse!.data!.data![i].subject!.id!] = i;
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        widget.addOralMark
                            ? const SizedBox(
                                width: 0,
                                height: 0,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Exam Date:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            _presentDatePicker(_startDate);
                                          },
                                          child: Text(
                                            '${_startDate.day}-${_startDate.month}-${_startDate.year}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Start at:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            _presentStartTimePicker(_startTime);
                                          },
                                          child: Text(
                                            '${_startTime.hour}:${_startTime.minute}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Ends after:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            widgetSize.getWidth(140, context),
                                        //height: 50,
                                        child: TextFormField(
                                          focusNode: _focusNode,
                                          cursorColor: const Color.fromARGB(
                                            255,
                                            255,
                                            167,
                                            38,
                                          ),
                                          controller: _controller,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  20,
                                                ),
                                              ),
                                              borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: Color.fromARGB(
                                                  255,
                                                  255,
                                                  167,
                                                  38,
                                                ),
                                              ),
                                            ),
                                            labelText: "minutes",
                                            labelStyle: TextStyle(
                                              color: _focusNode.hasFocus
                                                  ? const Color.fromARGB(
                                                      255,
                                                      255,
                                                      167,
                                                      38,
                                                    )
                                                  : Colors.grey,
                                            ),
                                            hintText: "20",
                                            icon: Icon(
                                              Icons.timer,
                                              color: _focusNode.hasFocus
                                                  ? const Color.fromARGB(
                                                      255,
                                                      255,
                                                      167,
                                                      38,
                                                    )
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      )
                                      // TextButton(
                                      //     onPressed: () {
                                      //       _presentEndTimePicker(_endTime);
                                      //     },
                                      //     child: Text(
                                      //       '${_endTime.hour}:${_endTime.minute}',
                                      //       style: const TextStyle(
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.w600,
                                      //           color: Colors.grey),
                                      //     ))
                                    ],
                                  ),
                                ],
                              ),
                        SizedBox(
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
                                              .data![0].classes![index].class_id!;
                                          classroomId = provider
                                              .getTeacherSubjectsResponse!
                                              .data!
                                              .data![0].classes![index].classroom_id!;
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
                                            .classes!
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
                                                      '${e.classes!.name!}  ${e.classrooms!.name.toString()}',
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
                                        'Select season: ',
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
                                            selectedSeason = index;
                                          });
                                        },
                                        clipBehavior: Clip.antiAlias,
                                        controller: fixedExtentScrollController,
                                        physics:
                                            const FixedExtentScrollPhysics(),
                                        perspective: 0.005,
                                        offAxisFraction: -0.0,
                                        diameterRatio: 2,
                                        itemExtent: 60,
                                        children: [1, 2].map((e) {
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
                                                      e.toString(),
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
                              subjectDDV = Provider.of<AppProvider>(context,
                                      listen: false)
                                  .getTeacherSubjectsResponse!
                                  .data!
                                  .data![0].subject!.id;
                              classId = classId == 0
                                  ? Provider.of<AppProvider>(context,
                                          listen: false)
                                      .getTeacherSubjectsResponse!
                                      .data!
                                      .data![0].classes![0].class_id!
                                  : classId;
                              classroomId = classroomId == 0
                                  ? Provider.of<AppProvider>(context,
                                          listen: false)
                                      .getTeacherSubjectsResponse!
                                      .data!
                                      .data![0].classes![0].classroom_id!
                                  : classroomId;
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  child: widget.addOralMark
                                      ? AddOralMark(
                                          subjectId: subjectDDV!,
                                          classId: classId,
                                          classroomId: classroomId,
                                        )
                                      : AddQuizScreen(
                                          start: DateTime(
                                              _startDate.year,
                                              _startDate.month,
                                              _startDate.day,
                                              _startTime.hour,
                                              _startTime.minute),
                                          end: _startDate.add(Duration(
                                              minutes:
                                                  int.parse(_controller.text))),
                                          season: selectedSeason,
                                          classId: classId,
                                          subjectId: subjectDDV!,
                                          classroomId: classroomId),
                                  type: PageTransitionType.leftToRightPop,
                                  childCurrent: widget,
                                  duration: const Duration(milliseconds: 400),
                                ),
                              );
                            },
                            child: const Text(
                              'Add quiz to students',
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
                    );
                  }

                case Status.ERROR:
                  return err.Error(
                    errorMsg: provider.getTeacherSubjectsResponse!.message!,
                  );
                default:
                  return Container();
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
