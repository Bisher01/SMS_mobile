import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens.dart';

class MentorAttendanceScreen extends StatefulWidget {
  const MentorAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<MentorAttendanceScreen> createState() => _MentorAttendanceScreenState();
}

class _MentorAttendanceScreenState extends State<MentorAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Student's Attendance"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTopJoined,
                childCurrent: widget,
                duration: const Duration(milliseconds: 300),
                child: const MentorMainScreen(),
              ),
            );
          },
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 3,
          ),
          itemBuilder: (context, index) {
            int selectedIndex = 0;
            List<String> chipsList = [
              "A",
              "L",
              "E",
            ];
            List<Widget> absenceChips() {
              List<Widget> chips = [];
              for (int i = 0; i < chipsList.length; i++) {
                Widget item = ChoiceChip(
                  elevation: 2,
                  label: Text(
                    chipsList[i],
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.teal,
                  selectedColor: Colors.red,
                  selected: selectedIndex == i,
                  onSelected: (bool value) {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                );
                chips.add(item);
              }
              return chips;
            }

            return Card(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/jj.jpg',
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    const Text('judi kab'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: absenceChips(),
                      // ChoiceChip(
                      //   onSelected: (isSelected) {
                      //     setState((){
                      //       selectedChoice =0;
                      //     });
                      //   },
                      //   label: const Text('A'),
                      //   backgroundColor: Colors.teal,
                      //   selected: selectedChoice ==0,
                      //   selectedColor: Colors.red,
                      // ),
                      // ChoiceChip(
                      //   onSelected: (bool isSelected) {
                      //     setState((){
                      //       selectedChoice = isSelected?;
                      //     });
                      //   },
                      //   label: const Text('L'),
                      //   backgroundColor: Colors.teal,
                      //   selected: selectedChoice ==1,
                      //   selectedColor: Colors.red,
                      // ),
                      // ChoiceChip(
                      //   onSelected: (isSelected) {
                      //     setState((){
                      //       selectedChoice =2;
                      //     });
                      //   },
                      //   label: const Text('E'),
                      //   backgroundColor: Colors.teal,
                      //   selected: selectedChoice ==2,
                      //   selectedColor: Colors.red,
                      // ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
