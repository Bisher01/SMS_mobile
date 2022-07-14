import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import '../utill/utill.dart';
import '../screens/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [Image.asset('assets/icons/gear.png',height: 40,width: 40,),SizedBox(width: 10,)],
        title:  const Text('Bisher Hasani',maxLines: 1,style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 18,
        ),),
        centerTitle: false,
      ),
      body: GridView.count(
        padding: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 30),

        crossAxisCount: 2,
        children: [
          Card(
              elevation: 3,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                child: Column(
                  children: [
                    Image.asset('assets/icons/user-2.png',height: 100,),
                    const SizedBox(height: 20,),
                    const Text('Profile',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),)
                  ],
                ),
              )
          ),
          Card(
            elevation: 3,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
              child: Column(
                children: [
                  Image.asset('assets/icons/homework 2.png',height: 100,),
                  const SizedBox(height: 20,),
                  const Text('Homework',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),)
                ],
              ),
            )
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  child: const ExamSchedule(),
                  type:
                  PageTransitionType.leftToRightPop,
                  childCurrent: widget,
                  duration: Duration(milliseconds: 400),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/exam.png',height: 100,),
                      const SizedBox(height: 20,),
                      const Text('Exam',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),)
                    ],
                  ),
                )
            ),
          ),
          Card(
              elevation: 3,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                child: Column(
                  children: [
                    Image.asset('assets/icons/score.png',height: 100,),
                    const SizedBox(height: 20,),
                    const Text('Marks',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),)
                  ],
                ),
              )
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  child: Schedule(),
                  type:
                  PageTransitionType.leftToRightPop,
                  childCurrent: widget,
                  duration: Duration(milliseconds: 400),
                ),
              );
            },
            child: Card(
                elevation: 3,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/schedule.png',height: 100,),
                      const SizedBox(height: 20,),
                      const Text('Schedule',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),)
                    ],
                  ),
                )
            ),
          ),
          Card(
              elevation: 3,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                child: Column(
                  children: [
                    Image.asset('assets/icons/meeting.png',height: 100,),
                    const SizedBox(height: 20,),
                    const Text('Meetings',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),)
                  ],
                ),
              )
          ),
          Card(
              elevation: 3,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                child: Column(
                  children: [
                    Image.asset('assets/icons/megaphone.png',height: 100,),
                    const SizedBox(height: 20,),
                    const Text('Announcement',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),)
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
