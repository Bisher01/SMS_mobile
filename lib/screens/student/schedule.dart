import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  double _width = 10;
  bool isOpened = false;
  int selectedDay = 1;
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
                duration: const Duration(milliseconds: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedDay = 7;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(6)),
                                  color: selectedDay == 7
                                      ? Colors.orange[400]
                                      : Colors.grey[800],boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                )
                              ],),
                              constraints: BoxConstraints.expand(
                                width: isOpened?40:0,
                                height: 40,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'S',
                                    style: TextStyle(
                                      color: selectedDay == 7
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ChakraPetch'
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedDay = 1;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                                  color: selectedDay == 1
                                      ? Colors.orange[400]
                                      : Colors.grey[800],boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                )
                              ],),
                              constraints: BoxConstraints.expand(
                                width: isOpened?40:0,
                                height: 40,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'M',
                                    style: TextStyle(
                                      color: selectedDay == 1
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'ChakraPetch',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedDay = 2;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                color: selectedDay == 2
                                    ? Colors.orange[400]
                                    : Colors.grey[800],boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                )
                              ],),
                              constraints: BoxConstraints.expand(
                                width: isOpened?40:0,
                                height: 40,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'T',
                                    style: TextStyle(
                                      color: selectedDay == 2
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ChakraPetch',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedDay = 3;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                color: selectedDay == 3
                                    ? Colors.orange[400]
                                    : Colors.grey[800],boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                )
                              ],),
                              constraints: BoxConstraints.expand(
                                width: isOpened?40:0,
                                height: 40,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'W',
                                    style: TextStyle(
                                      color: selectedDay == 3
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ChakraPetch',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedDay = 4;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                color: selectedDay == 4
                                    ? Colors.orange[400]
                                    : Colors.grey[800],boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                )
                              ],),
                              constraints: BoxConstraints.expand(
                                width: isOpened?40:0,
                                height: 40,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'T',
                                    style: TextStyle(
                                      color: selectedDay == 4
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ChakraPetch',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedDay = 5;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                color: selectedDay == 5
                                    ? Colors.orange[400]
                                    : Colors.grey[800],boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                )
                              ],),
                              constraints: BoxConstraints.expand(
                                width: isOpened?40:0,
                                height: 40,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'F',
                                    style: TextStyle(
                                      color: selectedDay == 5
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ChakraPetch',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedDay = 6;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                color: selectedDay == 6
                                    ? Colors.orange[400]
                                    : Colors.grey[800],boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                )
                              ],),
                              constraints: BoxConstraints.expand(
                                width: isOpened?40:0,
                                height: 40,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'S',
                                    style: TextStyle(
                                      color: selectedDay == 6
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ChakraPetch',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),

                        ],
                      ),

              ),
              GestureDetector(
                onHorizontalDragEnd: (_) {
                  setState(() {
                    if (isOpened) {
                      _width = 10;
                      isOpened = false;
                    } else {
                      _width = 80;
                      isOpened = true;
                    }
                  });
                },
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
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: isOpened ? 5.0 : 0),
                          child: const RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'Schedule',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isOpened ? 4.0 : 0,
                              right: isOpened ? 0 : 8),
                          child: AnimatedRotation(
                            turns: isOpened ? 0 : 0.5,
                            duration: const Duration(milliseconds: 200),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 18,
                            ),
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
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                            style:  TextStyle(
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
                    height: 40,
                  ),
                  const Text(
                    'Schedule',
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
