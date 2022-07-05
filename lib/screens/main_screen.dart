import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utill/utill.dart';
import '../screens/screens.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedTab = 1;

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  bool isOpened = true;
  late AnimationController _controller;
  late Animation<double> _drawerAnimation;
  double studentCardHeight = 0;
  double teacherCardHeight = 0;
  double mentorsCardHeight = 0;

  List<Widget> pages = [

  ];

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _drawerAnimation = Tween<double>(begin: 250, end: 0).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isOpened = false;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isOpened = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              isOpened ? _controller.forward() : _controller.reverse();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          backgroundColor: ColorResources.green,
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, _) {
                  return Container(
                    width: _drawerAnimation.value,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        controller: ScrollController(),
                        //primary: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          SvgPicture.asset(
                            'login.svg',
                            height: widgetSize.getHeight(180, context),
                          ),
                          const Text(
                            'School Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                              setState((){
                                if(studentCardHeight==0){
                                  studentCardHeight=80;
                                  //teacherCardHeight=0;
                                  //mentorsCardHeight=0;
                                }
                                else{
                                  studentCardHeight=0;
                                }
                              });
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: ColorResources.green,
                                ),
                                Text(
                                  'Students',
                                  style: TextStyle(
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: studentCardHeight,
                            child: ListView(
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(left: 25,top: 10),
                              children: [
                                InkWell(
                                  child: SizedBox(
                                    width: _drawerAnimation.value,
                                    child: const Text(
                                      'Add Students',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: ColorResources.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 1;
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                InkWell(
                                  child: SizedBox(
                                    width: _drawerAnimation.value,
                                    child: const Text(
                                      'Show Students',
                                      style: TextStyle(
                                        color: ColorResources.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 2;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                          // ListTile(
                          //   leading: Icon(
                          //     Icons.ac_unit,
                          //     color: Colors.white,
                          //   ),
                          //   onTap: () {
                          //     setState(() {
                          //       selectedTab = 2;
                          //     });
                          //   },
                          //   title: const Text(
                          //     'Edit Students',
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                          // const Divider(
                          //   color: Colors.white,
                          // ),
                          InkWell(
                            onTap: (){
                              setState((){
                                if(teacherCardHeight==0){
                                  teacherCardHeight=80;
                                  //studentCardHeight=0;
                                  //mentorsCardHeight=0;
                                }
                                else{
                                  teacherCardHeight=0;
                                }
                              });
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: ColorResources.green,
                                ),
                                Text(
                                  'Teachers',
                                  style: TextStyle(
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: teacherCardHeight,
                            child: ListView(
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(left: 25,top: 10),
                              children: [
                                InkWell(
                                  child: SizedBox(
                                    width: _drawerAnimation.value,
                                    child: const Text(
                                      'Add Teachers',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: ColorResources.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 3;
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                InkWell(
                                  child: SizedBox(
                                    width: _drawerAnimation.value,
                                    child: const Text(
                                      'Show Teachers',
                                      style: TextStyle(
                                        color: ColorResources.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 4;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                          InkWell(
                            onTap: (){
                              setState((){
                                if(mentorsCardHeight==0){
                                  mentorsCardHeight=80;
                                  //studentCardHeight=0;
                                  //teacherCardHeight=0;
                                }
                                else{
                                  mentorsCardHeight=0;
                                }
                              });
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: ColorResources.green,
                                ),
                                Text(
                                  'Mentors',
                                  style: TextStyle(
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: mentorsCardHeight,
                            child: ListView(
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(left: 25,top: 10),
                              children: [
                                InkWell(
                                  child: SizedBox(
                                    width: _drawerAnimation.value,
                                    child: const Text(
                                      'Add Mentors',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: ColorResources.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 5;
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                InkWell(
                                  child: SizedBox(
                                    width: _drawerAnimation.value,
                                    child: const Text(
                                      'Show Mentors',
                                      style: TextStyle(
                                        color: ColorResources.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 6;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                          // ListTile(
                          //   leading: Icon(
                          //     Icons.ac_unit,
                          //     color: Colors.white,
                          //   ),
                          //   onTap: () {
                          //     setState(() {
                          //       selectedTab = 5;
                          //     });
                          //   },
                          //   title: const Text(
                          //     'Edit Teachers',
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                          // const Divider(
                          //   color: Colors.white,
                          // ),
                          ListTile(
                            leading: const Icon(
                              Icons.ac_unit,
                              color: ColorResources.green,
                            ),
                            onTap: () {},
                            title: const Text(
                              'Classes and Classrooms',
                              style: TextStyle(
                                color: ColorResources.green,
                              ),
                            ),
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.ac_unit,
                              color: ColorResources.green,
                            ),
                            onTap: () {},
                            title: const Text(
                              'Daily Schedule',
                              style: TextStyle(
                                color: ColorResources.green,
                              ),
                            ),
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.ac_unit,
                              color: ColorResources.green,
                            ),
                            onTap: () {},
                            title: const Text(
                              'Exam Schedule',
                              style: TextStyle(
                                color: ColorResources.green,
                              ),
                            ),
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.ac_unit,
                              color: ColorResources.green,
                            ),
                            onTap: () {},
                            title: const Text(
                              'Exams',
                              style: TextStyle(
                                color: ColorResources.green,
                              ),
                            ),
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.ac_unit,
                              color: ColorResources.green,
                            ),
                            onTap: () {
                              setState(() {
                                selectedTab = 7;
                              });
                            },
                            title: const Text(
                              'Academic Years',
                              style: TextStyle(
                                color: ColorResources.green,
                              ),
                            ),
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.ac_unit,
                              color: ColorResources.green,
                            ),
                            title: const Text(
                              'Settings',
                              style: TextStyle(
                                color: ColorResources.green,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedTab = 0;
                              });
                            },
                          ),
                          const Divider(
                            color: ColorResources.green,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: IndexedStack(
                index: selectedTab,
                children: pages,
              ),
            ),
          ],
        ));
  }
}
