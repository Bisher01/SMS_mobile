import 'package:flutter/material.dart';

import '../models/models.dart';
import '../utill/widget_size.dart';

class StudentShowCard extends StatefulWidget {
  final Student student;
  const StudentShowCard({required this.student, Key? key}) : super(key: key);

  @override
  State<StudentShowCard> createState() => _StudentShowCardState();
}

class _StudentShowCardState extends State<StudentShowCard> {
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
                          "student's name:",
                        ),
                        Text(
                            '${widget.student.f_name} ${widget.student.l_name}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student email',
                        ),
                        Text(
                          '${widget.student.email}',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student code',
                        ),
                        Text(
                          '${widget.student.code}',
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
                //birthdate blood
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //birthdate
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student birthdate',
                        ),
                        Text(
                          widget.student.birthdate.toString(),
                        ),
                      ],
                    ),
                    //blood
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student blood type',
                        ),
                        Text(
                          widget.student.blood_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //gender nationality
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //gender
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student gender',
                        ),
                        Text(
                          widget.student.gender_id.toString(),
                        ),
                      ],
                    ),
                    //nationality
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student nationality',
                        ),
                        Text(
                          widget.student.nationality_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //city religion
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //city
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student city',
                        ),
                        Text(
                          widget.student.address_id.toString(),
                        ),
                      ],
                    ),
                    //religion
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student religion',
                        ),
                        Text(
                          widget.student.religion_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //town class
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //town
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student town',
                        ),
                        Text(
                          widget.student.address_id.toString(),
                        ),
                      ],
                    ),
                    //class
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student class',
                        ),
                        Text(
                          widget.student.class_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //street classroom
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //street
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student street',
                        ),
                        Text(
                          widget.student.address_id.toString(),
                        ),
                      ],
                    ),
                    //classroom
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'student classroom',
                        ),
                        Text(
                          widget.student.classroom_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //edit
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit this student info',
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
