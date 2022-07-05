import 'package:flutter/material.dart';

import '../../models/models.dart';

class TeacherProfilePage extends StatefulWidget {
  final Teacher teacher;
  const TeacherProfilePage({Key? key, required this.teacher}) : super(key: key);

  @override
  State<TeacherProfilePage> createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          //picture
          CircleAvatar(
            child: Image.asset(
              widget.teacher.picture!,
            ),
          ),
          //name
          Text("Teacher's name: ${widget.teacher.f_name} ${widget.teacher.l_name}",),
          //email
          Text("Teacher's email: ${widget.teacher.email}",),
          //salary
          Text("Teacher's salary: ${widget.teacher.salary}",),
          //joining date grade
          Row(
            children: [
              Text("Teacher's joining date: ${widget.teacher.joining_date}",),
              Text("Teacher's grade: ${widget.teacher.grade_id}",),
            ],
          ),
          //gender religion
          Row(
            children: [
              Text("Teacher's gender: ${widget.teacher.gender_id}",),
              Text("Teacher's religion: ${widget.teacher.religion_id}",),
            ],
          ),
          //address
        ],
      ),
    );
  }
}
