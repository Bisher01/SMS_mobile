import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/screens/screens.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../../models/models.dart';
import '../../providers/app_provider.dart';

class MentorProfilePage extends StatefulWidget {
  final Mentor mentor;
  const MentorProfilePage({Key? key, required this.mentor}) : super(key: key);

  @override
  State<MentorProfilePage> createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage> {
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
        title: const Text('Teacher Profile'),
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
                  'assets/jj.jpg',
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
                      "Mentor's Information",
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
                      "Email: ${widget.mentor.email}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //code
                    Text(
                      "Code: ${widget.mentor.code}",
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
                      "City: ${widget.mentor.address_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //Town
                    Text(
                      "Town: ${widget.mentor.address_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //Street
                    Text(
                      "Street: ${widget.mentor.address_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    //Class
                    Text(
                      "Class: ${widget.mentor.class_id}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //joining date
                    Text(
                      "Joining Date: ${widget.mentor.joining_date}",
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
                    //Phone
                    Text(
                      "Phone: ${widget.mentor.phone} ",
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
                    "${widget.mentor.f_name} ${widget.mentor.l_name}",
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
                    'Mentor',
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
              'assets/jj.jpg',
              ),
              radius: 60,
            ),
          ),
        ],
      ),
    );
  }
}
