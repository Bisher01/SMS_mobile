import 'package:flutter/material.dart';

import '../../models/models.dart';

class MentorProfilePage extends StatefulWidget {
  final Mentor mentor;
  const MentorProfilePage({Key? key, required this.mentor}) : super(key: key);

  @override
  State<MentorProfilePage> createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          //name
          Text("Mentor's name: ${widget.mentor.f_name} ${widget.mentor.l_name}",),
          //email
          Text("Mentor's email: ${widget.mentor.email}",),
          //phone
          Text("Mentor's phone: ${widget.mentor.phone}",),
          //joining date
          Text("Mentor's joining date: ${widget.mentor.joining_date}",),
          //address
        ],
      ),
    );
  }
}
