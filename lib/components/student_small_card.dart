import 'package:flutter/material.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../models/models.dart';

class StudentSmallCard extends StatefulWidget {
  final Student student;
  const StudentSmallCard({required this.student, Key? key}) : super(key: key);

  @override
  State<StudentSmallCard> createState() => _StudentSmallCardState();
}

class _StudentSmallCardState extends State<StudentSmallCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            20,
          ),
          bottomRight: Radius.circular(
            20,
          ),
        ),
      ),
      width: widgetSize.getWidth(300, context),
      height: widgetSize.getHeight(300, context),
      child: Card(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/jj.jpg',
              fit: BoxFit.cover,
              height: widgetSize.getHeight(190, context),
              width: double.infinity,
            ),
            Text(
              "Name: ${widget.student.f_name} ${widget.student.l_name}",
              style: const TextStyle(color: Colors.black54),
            ),
            Text(
              "Email: ${widget.student.email}",
              style: const TextStyle(color: Colors.black54),
            ),
            Text(
              "Class: ${widget.student.class_classroom!.classes!.name!}",
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
