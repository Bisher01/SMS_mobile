import 'package:flutter/material.dart';
import '../../models/models.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Answer> answers = [];
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(251, 250, 250, 1),
        elevation: 0,
        actions: [
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
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            if(answers.length<index+1) {
              answers.add(Answer(questionId: index, choiceId: 0));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Question : ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        '30:00 min',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 15,
                  endIndent: 15,
                  indent: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child: Text(
                    '${index + 1}. this test question this test question this test question this test question this test question this test question this test question ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (answers[index].choiceId == 1) {
                        answers[index].choiceId = 0;
                      } else {
                        answers[index].choiceId = 1;
                      }
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      if (answers[index].choiceId == 1) {
                        answers[index].choiceId = 0;
                      } else {
                        answers[index].choiceId = 1;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: answers[index].choiceId == 1
                              ? Colors.orange[400]
                              : const Color.fromRGBO(70, 73, 81, 1),
                        ),
                        constraints: BoxConstraints.expand(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 60,
                        ),
                        child: Center(
                          child: Text(
                            'Exam question',
                            style: TextStyle(
                              color: answers[index].choiceId == 1
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        left: answers[index].choiceId == 1 ? width - 85 : 5,
                        top: 5,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedRotation(
                          turns: answers[index].choiceId == 1 ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: answers[index].choiceId == 1
                                    ? const Color.fromRGBO(70, 73, 81, 1)
                                    : Colors.orange[400]),
                            child: Center(
                              child: Text(
                                'A',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: answers[index].choiceId == 1
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (answers[index].choiceId == 2) {
                        answers[index].choiceId = 0;
                      } else {
                        answers[index].choiceId = 2;
                      }
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      if (answers[index].choiceId == 2) {
                        answers[index].choiceId = 0;
                      } else {
                        answers[index].choiceId = 2;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: answers[index].choiceId == 2
                              ? Colors.orange[400]
                              : const Color.fromRGBO(70, 73, 81, 1),
                        ),
                        constraints: BoxConstraints.expand(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 60,
                        ),
                        child: Center(
                          child: Text(
                            'Exam question',
                            style: TextStyle(
                              color: answers[index].choiceId == 2
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        left: answers[index].choiceId == 2 ? width - 85 : 5,
                        top: 5,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedRotation(
                          turns: answers[index].choiceId == 2 ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: answers[index].choiceId == 2
                                    ? const Color.fromRGBO(70, 73, 81, 1)
                                    : Colors.orange[400]),
                            child: Center(
                              child: Text(
                                'B',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: answers[index].choiceId == 2
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (answers[index].choiceId == 3) {
                        answers[index].choiceId = 0;
                      } else {
                        answers[index].choiceId = 3;
                      }
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      if (answers[index].choiceId == 3) {
                        answers[index].choiceId = 0;
                      } else {
                        answers[index].choiceId = 3;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: answers[index].choiceId == 3
                              ? Colors.orange[400]
                              : const Color.fromRGBO(70, 73, 81, 1),
                        ),
                        constraints: BoxConstraints.expand(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 60,
                        ),
                        child: Center(
                          child: Text(
                            'Exam question',
                            style: TextStyle(
                              color: answers[index].choiceId == 3
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        left: answers[index].choiceId == 3 ? width - 85 : 5,
                        top: 5,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedRotation(
                          turns: answers[index].choiceId == 3 ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: answers[index].choiceId == 3
                                    ? const Color.fromRGBO(70, 73, 81, 1)
                                    : Colors.orange[400]),
                            child: Center(
                              child: Text(
                                'C',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: answers[index].choiceId == 3
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (answers[index].choiceId == 4) {
                        answers[index].choiceId = 0;
                      } else {
                        answers[index].choiceId = 4;
                      }
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      if (answers[index].choiceId == 4) {
                        answers[index].choiceId = 0;
                      } else {
                        answers[index].choiceId = 4;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: answers[index].choiceId == 4
                              ? Colors.orange[400]
                              : const Color.fromRGBO(70, 73, 81, 1),
                        ),
                        constraints: BoxConstraints.expand(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 60,
                        ),
                        child: Center(
                          child: Text(
                            'Exam question',
                            style: TextStyle(
                              color: answers[index].choiceId == 4
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        left: answers[index].choiceId == 4 ? width - 85 : 5,
                        top: 5,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedRotation(
                          turns: answers[index].choiceId == 4 ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: answers[index].choiceId == 4
                                    ? const Color.fromRGBO(70, 73, 81, 1)
                                    : Colors.orange[400]),
                            child: Center(
                              child: Text(
                                'D',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: answers[index].choiceId == 4
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
