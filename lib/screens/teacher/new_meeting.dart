import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/utill/utill.dart';
import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
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
            primaryColor: const Color.fromARGB(
              255,
              255,
              167,
              38,
            ),
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(
                255,
                255,
                167,
                38,
              ),
            ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add new meeting",
          style: TextStyle(fontSize: 16, color: Colors.white),
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
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     top: 15,
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       const Text(
                        //         'Select subject:',
                        //         style: TextStyle(
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.w600,
                        //         ),
                        //       ),
                        //       DropdownButton<int>(
                        //           hint: const Text(
                        //             'Subject',
                        //           ),
                        //           value: subjectDDV,
                        //           elevation: 16,
                        //           underline: Container(
                        //             height: 2,
                        //             color: Colors.orange[400],
                        //           ),
                        //           onChanged: (int? newValue) {
                        //             setState(() {
                        //               subjectDDV = newValue ?? 0;
                        //               selectedSubject = subjects[subjectDDV];
                        //             });
                        //           },
                        //           items: provider
                        //               .getTeacherSubjectsResponse!.data!.data!
                        //               .map((e) {
                        //             return DropdownMenuItem<int>(
                        //               value: e.id,
                        //               child: Text(e.name!),
                        //             );
                        //           }).toList()),
                        //     ],
                        //   ),
                        // ),
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
                                        'Select class and classroom: ',
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
                                              .classes![index]
                                              .class_id!;
                                          classroomId = provider
                                              .getTeacherSubjectsResponse!
                                              .data!
                                              .data![0]
                                              .classes![index]
                                              .classroom_id!;
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
                              // const SizedBox(
                              //   width: 20,
                              // ),
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
                              //           'Select classroom: ',
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
                              //               selectedClassroom = index;
                              //             });
                              //             classroomId = provider
                              //                 .getTeacherSubjectsResponse!
                              //                 .data!
                              //                 .data![selectedSubject!]
                              //                 .class_classroom![index]
                              //                 .classrooms!
                              //                 .id!;
                              //           },
                              //           clipBehavior: Clip.antiAlias,
                              //           controller: fixedExtentScrollController,
                              //           physics:
                              //               const FixedExtentScrollPhysics(),
                              //           perspective: 0.005,
                              //           offAxisFraction: -0.0,
                              //           diameterRatio: 2,
                              //           itemExtent: 60,
                              //           children: provider
                              //               .getTeacherSubjectsResponse!
                              //               .data!
                              //               .data![selectedSubject!]
                              //               .class_classroom!
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
                              //                       padding:
                              //                           const EdgeInsets.all(
                              //                         16.0,
                              //                       ),
                              //                       child: Text(
                              //                         e.classrooms!.name!
                              //                             .toString(),
                              //                         textAlign:
                              //                             TextAlign.center,
                              //                         style: TextStyle(
                              //                             fontSize: 18.0,
                              //                             color: Colors
                              //                                 .orange[400]),
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
                            ],
                          ),
                        ),
                        TextField(
                          controller: controller,
                          keyboardType: TextInputType.emailAddress,
                          textDirection: TextDirection.ltr,
                          showCursor: true,
                          decoration: const InputDecoration(
                            hintText: 'google meet link',
                            border: OutlineInputBorder(
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
                            disabledBorder: OutlineInputBorder(
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
                            enabledBorder: OutlineInputBorder(
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
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
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
                          ),
                          cursorColor: const Color.fromARGB(
                            255,
                            255,
                            167,
                            38,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _presentDatePicker();
                          },
                          child: const Text(
                            'Select date',
                            style: TextStyle(
                              color: Color.fromARGB(
                                255,
                                255,
                                167,
                                38,
                              ),
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
                            onPressed: () async {
                              subjectDDV = Provider.of<AppProvider>(context,
                                      listen: false)
                                  .getTeacherSubjectsResponse!
                                  .data!
                                  .data![0].subject!
                                  .id!;
                              int id = Provider.of<AppProvider>(context,
                                      listen: false)
                                  .getId();
                              classId = classId == 0
                                  ? Provider.of<AppProvider>(context,
                                          listen: false)
                                      .getTeacherSubjectsResponse!
                                      .data!
                                      .data![0]
                                      .classes![0]
                                      .class_id!
                                  : classId;
                              classroomId = classroomId == 0
                                  ? Provider.of<AppProvider>(context,
                                          listen: false)
                                      .getTeacherSubjectsResponse!
                                      .data!
                                      .data![0]
                                      .classes![0]
                                      .classroom_id!
                                  : classroomId;
                              var response = await Provider.of<AppProvider>(
                                      context,
                                      listen: false)
                                  .addOnlineClass(
                                      classId: classId,
                                      subjectId: subjectDDV!,
                                      teacherId: id,
                                      classroomId: classroomId,
                                      link: controller.text,
                                      date: _selectedDate!);
                              if (await Provider.of<AppProvider>(context,
                                      listen: false)
                                  .checkInternet()) {
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
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                          },
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                    color: Colors.orange[400],
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
