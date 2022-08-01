import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../screens.dart';

class TeacherMainScreen extends StatefulWidget {
  const TeacherMainScreen({Key? key}) : super(key: key);

  @override
  State<TeacherMainScreen> createState() => _TeacherMainScreenState();
}

class _TeacherMainScreenState extends State<TeacherMainScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onDoubleTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Log Out'),
                      content: Text(
                        'Are you sure you want to log out?',
                      ),
                      elevation: 2,
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Log out',
                          style: TextStyle(color: Colors.orange[300],),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.orange[300],),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: Image.asset(
              'assets/icons/gear.png',
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Text(
          'Main Screen',
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: GridView.count(
        padding:
            const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 30),
        crossAxisCount: 2,
        children: [
          //profile
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const TeacherProfilePage(),
                  type: PageTransitionType.leftToRightPop,
                  childCurrent: widget,
                  duration: const Duration(milliseconds: 400),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/user-2.png',
                        height: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          //homework
          Card(
            elevation: 3,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/homework 2.png',
                    height: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Homework',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
          //exam schedule
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const ExamSchedule(
                    studentId: 3,
                  ),
                  type: PageTransitionType.leftToRightPop,
                  childCurrent: widget,
                  duration: const Duration(milliseconds: 400),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/exam.png',
                        height: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Exam',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          //marks
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const SelectClassSubjectClassroom(),
                  type: PageTransitionType.leftToRightPop,
                  childCurrent: widget,
                  duration: const Duration(milliseconds: 400),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/score.png',
                        height: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Marks',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          //schedule
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const Schedule(),
                  type: PageTransitionType.leftToRightPop,
                  childCurrent: widget,
                  duration: const Duration(milliseconds: 400),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/schedule.png',
                        height: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Schedule',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          //meetings
          Card(
            elevation: 3,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/meeting.png',
                    height: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Meetings',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
          //announcements
          Card(
              elevation: 3,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/megaphone.png',
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Announcement',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )),
          //exams
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const SelectClassSubject(),
                  type: PageTransitionType.leftToRightPop,
                  childCurrent: widget,
                  duration: const Duration(milliseconds: 400),
                ),
              );
            },
            child: Card(
              elevation: 3,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/exam.png',
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Exams',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
