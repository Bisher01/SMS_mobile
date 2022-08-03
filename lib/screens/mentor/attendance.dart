import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sms_mobile/utill/utill.dart';
import '../../models/models.dart';
import '../screens.dart';


class MentorAttendanceScreen extends StatefulWidget {
  const MentorAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<MentorAttendanceScreen> createState() => _MentorAttendanceScreenState();
}

class _MentorAttendanceScreenState extends State<MentorAttendanceScreen> {
  List<StudentAttendance> attendance = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Student's Attendance",style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 3.5,mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            attendance.add(StudentAttendance(id: 1,status: 0));
            return Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          'assets/jj.jpg',
                        ),
                      ),
                      const Text('judi kab',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'ChakraPetch',
                      ),),
                      const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            onTap: () {
                              setState(() {
                                attendance[index].status=1;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: attendance[index].status==1?ColorResources.green:Colors.grey[300]!,width: 2),
                                color: attendance[index].status==1?ColorResources.green:Colors.grey[100],
                              ),
                              constraints: const BoxConstraints.expand(
                                width: 45 ,
                                height: 45,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'P',
                                    style: TextStyle(
                                      color: attendance[index].status==1?Colors.white:Colors.black,
                                      fontSize: attendance[index].status==1?23:20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ChakraPetch',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                setState(() {
                                  attendance[index].status=2;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: attendance[index].status==2?const Color.fromRGBO(227, 85, 112, 1):Colors.grey[300]!,width: 2),
                                  color: attendance[index].status==2?const Color.fromRGBO(227, 85, 112, 1):Colors.grey[100],
                                ),
                                constraints: const BoxConstraints.expand(
                                  width: 45 ,
                                  height: 45,
                                ),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'A',
                                      style: TextStyle(
                                        color: attendance[index].status==2?Colors.white:Colors.black,
                                        fontSize: attendance[index].status==2?23:20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'ChakraPetch',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            onTap: () {
                              setState(() {
                                attendance[index].status=3;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: attendance[index].status==3?Colors.orange[400]!:Colors.grey[300]!,width: 2),
                                color: attendance[index].status==3?Colors.orange[400]:Colors.grey[100],
                              ),
                              constraints: const BoxConstraints.expand(
                                width: 45 ,
                                height: 45,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'L',
                                    style: TextStyle(
                                      color: attendance[index].status==3?Colors.white:Colors.black,
                                      fontSize: attendance[index].status==3?23:20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ChakraPetch',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
