import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/screens/screens.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../../models/models.dart';
import '../../providers/app_provider.dart';

class StudentProfilePage extends StatefulWidget {
  final Student student;
  const StudentProfilePage({Key? key, required this.student}) : super(key: key);

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  initState() {
    // final id =Provider.of<AppProvider>(context, listen: false).getId();
    // final role =Provider.of<AppProvider>(context, listen: false).getRole();
    // Provider.of<AppProvider>(context, listen: false).getTeacher(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Student Profile'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTopJoined,
                childCurrent: widget,
                duration: const Duration(milliseconds: 300),
                child: MainScreen(),
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: widgetSize.getHeight(500, context),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.student.picture!,
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
                250,
                context,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    35,
                  ),
                  topRight: Radius.circular(
                    35,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  // top: widgetSize.getHeight(
                  //   30,
                  //   context,
                  // ),
                ),
                child: ListView(
                  children: [
                    const Text(
                      "Student's Information",
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
                      "Email: ${widget.student.email}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //code
                    Text(
                      "Code: ${widget.student.code}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Parent's info ",
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
                    //National number
                    Text(
                      "National number: ${widget.student.parent!.national_number!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //Town
                    Text(
                      "Email: ${widget.student.parent!.email!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //Code
                    Text(
                      "Code: ${widget.student.parent!.code!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //father
                    Text(
                      "Father's name: ${widget.student.parent!.father_name!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //mother
                    Text(
                      "Mother's name: ${widget.student.parent!.mother_name!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //job
                    Text(
                      "Job: ${widget.student.parent!.jop!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //phone
                    Text(
                      "Phone: ${widget.student.parent!.phone!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                      "City: ${widget.student.address!.city!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //Town
                    Text(
                      "Town: ${widget.student.address!.town!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //Street
                    Text(
                      "Street: ${widget.student.address!.street!}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "School related info ",
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
                    //birthdate
                    Text(
                      "Birthdate: ${widget.student.birthdate}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //grade
                    Text(
                      "Grade: ${widget.student.grade_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //class
                    Text(
                      "Class: ${widget.student.class_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //classroom
                    Text(
                      "Classroom: ${widget.student.classroom_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                      "Gender: ${widget.student.gender_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //Religion
                    Text(
                      "Religion: ${widget.student.religion_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //nationality
                    Text(
                      "Nationality: ${widget.student.nationality_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //blood
                    Text(
                      "Blood type: ${widget.student.blood_id}",
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
            top: 240,
            right: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "${widget.student.f_name} ${widget.student.l_name}",
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
                    'Student',
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
                  190,
                  context,
                ),
                left: 45),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                widget.student.picture!,
              ),
              radius: 60,
            ),
          ),
        ],
      ),
    );
  }
}







