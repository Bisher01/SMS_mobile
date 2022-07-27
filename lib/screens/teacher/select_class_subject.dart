import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../screens.dart';

class SelectClassSubject extends StatefulWidget {
  const SelectClassSubject({Key? key}) : super(key: key);

  @override
  State<SelectClassSubject> createState() => _SelectClassSubjectState();
}

class _SelectClassSubjectState extends State<SelectClassSubject> {
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  var classes = ['1', '2', '3', '4', '5', '6'];
  int selectedSubject = 0;
  int selectedClass = 0;
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
                child: const AllExamsScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 12,
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

                      },
                      clipBehavior: Clip.antiAlias,
                      controller: fixedExtentScrollController,
                      physics: const FixedExtentScrollPhysics(),
                      perspective: 0.005,
                      offAxisFraction: -0.0,
                      diameterRatio: 2,
                      itemExtent: 60,
                      children: classes.map((e) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    16.0,
                                  ),
                                  child: Text(
                                    e,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.orange[400]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 12,
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

                      },
                      clipBehavior: Clip.antiAlias,
                      controller: fixedExtentScrollController,
                      physics: const FixedExtentScrollPhysics(),
                      perspective: 0.005,
                      offAxisFraction: -0.0,
                      diameterRatio: 2,
                      itemExtent: 60,
                      children: classes.map((e) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border: Border.all(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    16.0,
                                  ),
                                  child: Text(
                                    e,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.orange[400]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
