import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/models/models.dart';
import 'package:sms_mobile/screens/teacher/add_quiz.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../screens.dart';
import '../../components/error.dart' as err;

class NewMeeting extends StatefulWidget {
  const NewMeeting({Key? key}) : super(key: key);

  @override
  State<NewMeeting> createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();

  Map<int, int> subjects = {};

  @override
  initState() {
    int id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false).getTeacherSubjects(id);
    super.initState();
  }

  int? selectedSubject = 0;
  int selectedClass = 0;
  int selectedClassroom = 0;
  int classId = 0;
  int classroomId = 0;
  int? subjectDDV;

  TextEditingController controller = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0Xff2BC3BB),
            colorScheme: const ColorScheme.light(primary: Color(0Xff2BC3BB)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  ///TODO: selectedSubject
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
                          .getTeacherSubjectsResponse!.data!.data![i].id!] = i;
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Select subject:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              DropdownButton<int>(
                                  hint: const Text(
                                    'Subject',
                                  ),
                                  value: subjectDDV,
                                  elevation: 16,
                                  underline: Container(
                                    height: 2,
                                    color: Colors.orange[400],
                                  ),
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      subjectDDV = newValue ?? 0;
                                      selectedSubject = subjects[subjectDDV];
                                    });
                                  },
                                  items: provider
                                      .getTeacherSubjectsResponse!.data!.data!
                                      .map((e) {
                                    return DropdownMenuItem<int>(
                                      value: e.id,
                                      child: Text(e.name!),
                                    );
                                  }).toList()),
                            ],
                          ),
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
                                              .data![selectedSubject!]
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
                                            .data![selectedSubject!]
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
                                        'Select classroom: ',
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
                                            selectedClassroom = index;
                                          });
                                          classroomId = provider
                                              .getTeacherSubjectsResponse!
                                              .data!
                                              .data![selectedSubject!]
                                              .class_classroom![index]
                                              .classrooms!
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
                                            .data![selectedSubject!]
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
                                                      e.classrooms!.name!
                                                          .toString(),
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
                        TextField(
                          controller: controller,
                        ),
                        TextButton(
                          onPressed: () {
                            _presentDatePicker();
                          },
                          child: Text(
                            'Select date',
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
                            onPressed: () async {
                              int id = Provider.of<AppProvider>(context,listen: false).getId();
                              var response = await Provider.of<AppProvider>(context,listen: false).addOnlineClass(
                                  classId: classId, subjectId: subjectDDV!, teacherId: id, classroomId: classroomId,
                                  link: controller.text, date: _selectedDate!);
                              if(await Provider.of<AppProvider>(context,listen: false).checkInternet()){
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
                                                onPressed: () =>
                                                    Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        child:
                                                        const TeacherMainScreen(),
                                                        type: PageTransitionType
                                                            .bottomToTopJoined,
                                                        childCurrent:
                                                        widget,
                                                        duration:
                                                        const Duration(
                                                            milliseconds:
                                                            300),
                                                      ),
                                                    ),
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
                                              'Your meeting is added successfully',
                                            ),
                                          );
                                        });
                                  }
                                }
                              }

                            },
                            child: const Text(
                              'Add meeting',
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
                    errorMsg: provider.getStudentExamResponse!.message!,
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
}
