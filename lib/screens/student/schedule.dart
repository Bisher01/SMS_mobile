import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  double _width = 0;
  bool isOpened=false;
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
      body: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: _width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black87,
                duration: Duration(milliseconds: 200),
                child: Column(
                  children: [
                  ],
                ),
              ),
              GestureDetector(
                onHorizontalDragStart: (_){
                  setState((){
                    if(isOpened) {
                      _width = 10;
                      isOpened = false;
                    }
                    else{
                      _width = 80;
                      isOpened = true;
                    }
                  });
                },
                // onTap: (){
                //   setState((){
                //     if(isOpened) {
                //         _width = 10;
                //         isOpened = false;
                //     }
                //     else{
                //         _width = 80;
                //         isOpened = true;
                //     }
                //   });
                // },
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'Schedule',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 20),
                  child: Row(
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
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${months[DateTime.now().month]} ${DateTime.now().year.toString().substring(2)}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        DateTime.now().day.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 44,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
