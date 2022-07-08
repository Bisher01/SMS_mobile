import 'package:flutter/material.dart';
import 'package:sms_mobile/components/components.dart';
import 'package:sms_mobile/utill/utill.dart';

class ExamSchedule extends StatefulWidget {
  const ExamSchedule({Key? key}) : super(key: key);

  @override
  State<ExamSchedule> createState() => _ExamScheduleState();
}

class _ExamScheduleState extends State<ExamSchedule> {
  int selectedTab = 0;
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      days[DateTime.now().weekday],
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'ChakraPetch',
                          letterSpacing: 0.5),
                    ),
                    Text(
                      '${months[DateTime.now().month]} ${DateTime.now().year.toString().substring(2)}',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'ChakraPetch',
                          letterSpacing: 0.5),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateTime.now().day.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                      fontFamily: 'ChakraPetch'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Exam Schedule',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Orbitron',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.8,
              ),
            ),
            const Divider(
              thickness: 2,
              height: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: widgetSize.getHeight(100, context),
              child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: SizedBox(
                      width: widgetSize.getWidth(50, context),
                      height: widgetSize.getHeight(110, context),
                      child: Card(
                        elevation: selectedTab == index ? 3 : 0,
                        color:
                            selectedTab == index ? Colors.orange : Color.fromARGB(1, 250, 250, 250),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'S',
                              style: TextStyle(
                                color: selectedTab == index
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                            Text(
                              '18',
                              style: TextStyle(
                                color: selectedTab == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Visibility(
                              visible: selectedTab == index,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      width: widgetSize.getWidth(200, context),
                      height: widgetSize.getHeight(120, context),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color: Colors.pinkAccent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Complete user',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'easy done',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
