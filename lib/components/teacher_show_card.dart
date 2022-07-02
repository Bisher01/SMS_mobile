import 'package:flutter/material.dart';
import '../models/models.dart';

import '../utill/widget_size.dart';

class TeacherShowCard extends StatefulWidget {
  final Teacher teacher;
  const TeacherShowCard({required this.teacher,Key? key}) : super(key: key);

  @override
  State<TeacherShowCard> createState() => _TeacherShowCardState();
}

class _TeacherShowCardState extends State<TeacherShowCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white70,
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        children: [
          //picture name email code
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widgetSize.getWidth(70, context),
                  height: widgetSize.getHeight(90, context),
                  child: Image.asset(
                    'back.jpg',
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "teacher's name:",
                        ),
                        Text(
                            '${widget.teacher.f_name} ${widget.teacher.l_name}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher email',
                        ),
                        Text(
                          '${widget.teacher.email}',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher code',
                        ),
                        Text(
                          '${widget.teacher.code}',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //joining date salary
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //joining date
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher joining date',
                        ),
                        Text(
                          widget.teacher.joining_date.toString(),
                        ),
                      ],
                    ),
                    //salary
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher salary',
                        ),
                        Text(
                          widget.teacher.salary.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //gender grade
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //gender
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher gender',
                        ),
                        Text(
                          widget.teacher.gender_id.toString(),
                        ),
                      ],
                    ),
                    //nationality
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher grade',
                        ),
                        Text(
                          widget.teacher.grade_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //city town
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //city
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher city',
                        ),
                        Text(
                          widget.teacher.address_id.toString(),
                        ),
                      ],
                    ),
                    //town
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher town',
                        ),
                        Text(
                          widget.teacher.address_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //street religion
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //town
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher street',
                        ),
                        Text(
                          widget.teacher.address_id.toString(),
                        ),
                      ],
                    ),
                    //religion
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'teacher religion',
                        ),
                        Text(
                          widget.teacher.religion_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //edit
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit this teacher info',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
