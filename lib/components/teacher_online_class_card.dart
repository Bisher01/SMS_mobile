import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/screens/student/pdf_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/app_provider.dart';
import '../models/models.dart';
import '../services/api_response.dart';
import '../utill/widget_size.dart';
import 'package:intl/intl.dart';

class TeacherOnlineClassCard extends StatefulWidget {
  final TeacherOnlineClass onlineClass;
  const TeacherOnlineClassCard({required this.onlineClass, Key? key})
      : super(key: key);

  @override
  State<TeacherOnlineClassCard> createState() => _TeacherOnlineClassCardState();
}

class _TeacherOnlineClassCardState extends State<TeacherOnlineClassCard> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  googleMeet(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      EasyLoading.showError('Could not launch $url');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color:  Color.fromARGB(255, 255, 167, 38,),
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //title
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                "Meeting info:",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 167, 38,),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //subject name
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //subject
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Subject: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text: widget.onlineClass.teacher_subject!
                                    .subjects!.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //class
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Class: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text:
                                '${widget.onlineClass.teacher_subject!.class_classrooms!.classes!.name}',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //classroom
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Classroom: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text:
                                '${widget.onlineClass.teacher_subject!.class_classrooms!.classrooms!.name}',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //date
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Date: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text:
                                dateFormat.format(widget.onlineClass.date!),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                googleMeet(widget.onlineClass.link!);
              },
              child: const Text(
                'go to link',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 167, 38,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
