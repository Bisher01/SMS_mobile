import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../../models/models.dart';
import '../../providers/app_provider.dart';

class TeacherProfilePage extends StatefulWidget {
  final Teacher teacher;
  const TeacherProfilePage({Key? key, required this.teacher}) : super(key: key);

  @override
  State<TeacherProfilePage> createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  @override
  initState() {
    // final id =Provider.of<AppProvider>(context, listen: false).getId();
    // final role =Provider.of<AppProvider>(context, listen: false).getRole();
    // Provider.of<AppProvider>(context, listen: false).getTeacher(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widgetSize.getHeight(500, context),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                widget.teacher.picture!,
              ),
              colorFilter: ColorFilter.mode(
                Colors.black54.withOpacity(0.8),
                BlendMode.darken,
              ),
            ),
          ),
          // child: Image.asset(
          //   widget.teacher.picture!,
          // ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: widgetSize.getHeight(
              200,
              context,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  25,
                ),
                topRight: Radius.circular(
                  25,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: widgetSize.getHeight(
                  70,
                  context,
                ),
              ),
              child: ListView(
                children: [
                  const Text(
                    "Teacher's Information",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  //email
                  Text(
                    "Email: ${widget.teacher.email}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  //code
                  Text(
                    "Code: ${widget.teacher.code}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  const Text(
                    "Address ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  //City
                  Text(
                    "City: ${widget.teacher.address_id}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  //Town
                  Text(
                    "Town: ${widget.teacher.address_id}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  //Street
                  Text(
                    "Street: ${widget.teacher.address_id}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  const Text(
                    "Work info ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  //salary
                  Text(
                    "Salary: ${widget.teacher.salary}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  //joining date
                  Text(
                    "Joining Date: ${widget.teacher.joining_date}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  //Grade
                  Text(
                    "Grade: ${widget.teacher.grade_id}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  const Text(
                    "Personal info ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  //Gender
                  Text(
                    "Gender: ${widget.teacher.gender_id}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  //Religion
                  Text(
                    "Religion: ${widget.teacher.religion_id}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 195,
          right: 100,
          child: Column(
            children: [
              //name
              Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                  "${widget.teacher.f_name} ${widget.teacher.l_name}",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(),
                child: Text(
                  'Teacher',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: widgetSize.getHeight(
                150,
                context,
              ),
              left: 45),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              widget.teacher.picture!,
            ),
            radius: 60,
          ),
        ),
      ],
    );
  }
}
