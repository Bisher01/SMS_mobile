import 'package:flutter/material.dart';

import '../../models/models.dart';

class ParentProfilePage extends StatefulWidget {
  final Parent parent;
  const ParentProfilePage({Key? key, required this.parent}) : super(key: key);

  @override
  State<ParentProfilePage> createState() => _ParentProfilePageState();
}

class _ParentProfilePageState extends State<ParentProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          //mother father
          Row(children: [
            Text("Mother's name: ${widget.parent.mother_name}",),
            Text("Father's name: ${widget.parent.father_name}",),
          ],),
          //email phone
          Row(children: [
            Text("Parent's email: ${widget.parent.email}",),
            Text("Parent's phone: ${widget.parent.phone}",),
          ],),
          //national number job
          Row(children: [
            Text("Parent's job: ${widget.parent.jop}",),
            Text("Parent's national number: ${widget.parent.national_number}",),
          ],),
        ],
      ),
    );
  }
}
