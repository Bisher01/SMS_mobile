import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sms_mobile/utill/utill.dart';
import '../screens.dart';

class AllExamsScreen extends StatefulWidget {
  const AllExamsScreen({Key? key}) : super(key: key);

  @override
  State<AllExamsScreen> createState() => _AllExamsScreenState();
}

class _AllExamsScreenState extends State<AllExamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Teacher's exams",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            child: SizedBox(
              width: double.infinity,
              height: widgetSize.getHeight(100, context),
              child: Card(
                color: Colors.orange[400],
                elevation: 1.5,
                child: const Center(
                  child: Text(
                    'Add new questions to the bank',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: widgetSize.getHeight(20, context),
          ),
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
            child: SizedBox(
              width: double.infinity,
              height: widgetSize.getHeight(100, context),
              child: Card(
                color: Colors.orange[400],
                elevation: 1.5,
                child: const Center(
                  child: Text(
                    'Add a new exam from the bank',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
