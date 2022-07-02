import 'package:flutter/material.dart';
import '../models/models.dart';

import '../utill/widget_size.dart';

class MentorShowCard extends StatefulWidget {
  final Mentor mentor;
  const MentorShowCard({required this.mentor,Key? key}) : super(key: key);

  @override
  State<MentorShowCard> createState() => _MentorShowCardState();
}

class _MentorShowCardState extends State<MentorShowCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white70,
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        children: [
          //picture name email code
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widgetSize.getWidth(70, context),
                  height: widgetSize.getHeight(90, context),
                  child: Image.asset(
                    'back.jpg',
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "mentor's name:",
                        ),
                        Text(
                            '${widget.mentor.f_name} ${widget.mentor.l_name}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'mentor email',
                        ),
                        Text(
                          '${widget.mentor.email}',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'mentor code',
                        ),
                        Text(
                          '${widget.mentor.code}',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //joining date phone
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //joining date
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'mentor joining date',
                        ),
                        Text(
                          widget.mentor.joining_date.toString(),
                        ),
                      ],
                    ),
                    //salary
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'mentor phone',
                        ),
                        Text(
                          widget.mentor.phone.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //class city
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //class
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'mentor class',
                        ),
                        Text(
                          widget.mentor.class_id.toString(),
                        ),
                      ],
                    ),
                    //city
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'mentor city',
                        ),
                        Text(
                          widget.mentor.address_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //town street
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //town
                    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'mentor town',
                      ),
                      Text(
                        widget.mentor.address_id.toString(),
                      ),
                    ],
                  ),
                    //street
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'mentor street',
                        ),
                        Text(
                          widget.mentor.address_id.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                //edit
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit this mentor info',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
