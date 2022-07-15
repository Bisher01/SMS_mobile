import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/models.dart';
import '../../utill/widget_size.dart';
import '../main_screen.dart';

class ParentProfilePage extends StatefulWidget {
  final Parent parent;
  const ParentProfilePage({Key? key, required this.parent}) : super(key: key);

  @override
  State<ParentProfilePage> createState() => _ParentProfilePageState();
}

class _ParentProfilePageState extends State<ParentProfilePage> {
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
                      "Parent's Information",
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
                      "Email: ${widget.parent.email}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //code
                    Text(
                      "Code: ${widget.parent.code}",
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
                    //father
                    Text(
                      "Father's name: ${widget.parent.father_name} ",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //mother
                    Text(
                      "Mother's name: ${widget.parent.mother_name} ",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    //Phone
                    Text(
                      "Phone: ${widget.parent.phone} ",
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
                    //Job
                    Text(
                      "Job: ${widget.parent.jop}",
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
          const Positioned(
            top: 240,
            right: 100,
            child: Padding(
              padding: EdgeInsets.only(),
              child: Text(
                'Parents',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widgetSize.getHeight(
                  190,
                  context,
                ),
                left: 45),
            child: const CircleAvatar(
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
