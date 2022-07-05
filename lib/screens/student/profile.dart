import 'package:flutter/material.dart';

import '../../models/models.dart';

class StudentProfilePage extends StatefulWidget {
  final Student student;
  const StudentProfilePage({Key? key, required this.student}) : super(key: key);

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          //picture
          CircleAvatar(
            child: Image.asset(
              widget.student.picture!,
            ),
          ),
          //name
          Text('${widget.student.f_name} ${widget.student.l_name}',),
          //email
          Text('${widget.student.email}',),
          //birthdate grade
          Row(children: [
            Text("Student's birthdate: ${widget.student.birthdate}",),
            Text("Student's grade: ${widget.student.grade_id}",),
          ],),
          //class classroom
          Row(children: [
            Text("Student's class: ${widget.student.class_id}",),
            Text("Student's classroom: ${widget.student.classroom_id}",),
          ],),
          //gender nationality
          Row(children: [
            Text("Student's gender: ${widget.student.gender_id}",),
            Text("Student's nationality: ${widget.student.nationality_id}",),
          ],),
          //religion blood
          Row(children: [
            Text("Student's religion: ${widget.student.religion_id}",),
            Text("Student's blood type: ${widget.student.blood_id}",),
          ],),
          Text("Parents's information:",),
          //mother father
          Row(children: [
            Text("Mother's name: ${widget.student.parent!.mother_name}",),
            Text("Father's name: ${widget.student.parent!.father_name}",),
          ],),
          //email phone
          Row(children: [
            Text("Parent's email: ${widget.student.parent!.email}",),
            Text("Parent's phone: ${widget.student.parent!.phone}",),
          ],),
          //national number job
          Row(children: [
            Text("Parent's job: ${widget.student.parent!.jop}",),
            Text("Parent's national number: ${widget.student.parent!.national_number}",),
          ],),
          Text("Student's address:",),
          Row(children: [
            Text("City: ${widget.student.address!.city}",),
            Text("Town: ${widget.student.address!.town}",),
            Text("Street: ${widget.student.address!.street}",),
          ],),
        ],
      ),
    );
  }
}
