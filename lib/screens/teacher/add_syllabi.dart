import 'package:dio/dio.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../screens.dart';
import '../../components/error.dart' as err;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as pt;

class AddSyllabi extends StatefulWidget {
  const AddSyllabi({Key? key}) : super(key: key);

  @override
  State<AddSyllabi> createState() => _AddSyllabiState();
}

class _AddSyllabiState extends State<AddSyllabi> {
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();

  @override
  initState() {
    int id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false).getTeacherSubjects(id);
    super.initState();
  }

  int selectedSubject = 0;
  int selectedClass = 0;
  int subjectId = 1;
  int classId = 1;

  ///TODO: class id and subject id are not changing
  FilePickerResult? result;
  void selectFile(int classId, int subjectId) async {
    try {
      result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);
    } catch (e) {}

    if (result != null && result!.files.isNotEmpty) {
      var file = await MultipartFile.fromFile(result!.files.single.path!,
          filename: pt.basename(result!.files.single.path!),
          contentType:
              MediaType("image", pt.basename(result!.files.single.path!)));
      final provider = Provider.of<AppProvider>(context, listen: false);
      if (await provider.checkInternet()) {
        var response = await provider.addSyllabi(classId, subjectId, file);
        if (response.status == Status.LOADING) {
          EasyLoading.showToast(
            'Loading...',
            duration: const Duration(
              milliseconds: 300,
            ),
          );
        }
        if (response.status == Status.ERROR) {
          EasyLoading.showError(response.data!.message!, dismissOnTap: true);
        }
        if (response.status == Status.COMPLETED) {
          if (response.data != null && response.data!.status!) {
            EasyLoading.showSuccess(response.data!.message!,
                dismissOnTap: true);
          }
        }
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Teacher's classes",
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
            Consumer<AppProvider>(
              builder: (context, provider, child) {
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
                                      physics: const FixedExtentScrollPhysics(),
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
                                                  padding: const EdgeInsets.all(
                                                    16.0,
                                                  ),
                                                  child: Text(
                                                    e.classes!.name!.toString(),
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
                        errorMsg: provider.getTeacherSubjectsResponse!.message!,
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
                onPressed: () async {
                  subjectId = Provider.of<AppProvider>(context, listen: false)
                      .getTeacherSubjectsResponse!
                      .data!
                      .data![0]
                      .id!;
                  selectFile(classId, subjectId);
                },
                child: Text(
                  'add a new book for ${Provider.of<AppProvider>(context, listen: false).getTeacherSubjectsResponse!.data!.data![0].name}',
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
