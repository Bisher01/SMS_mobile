import 'package:flutter/material.dart';
import 'package:sms_mobile/screens/student/pdf_screen.dart';
import '../models/models.dart';

class SyllabiCard extends StatefulWidget {
  final Syllabi syllabi;
  const SyllabiCard({required this.syllabi, Key? key}) : super(key: key);

  @override
  State<SyllabiCard> createState() => _SyllabiCardState();
}

class _SyllabiCardState extends State<SyllabiCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(
            255,
            255,
            167,
            38,
          ),
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //title
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                "Syllabi info",
                style: TextStyle(
                  color: Color.fromARGB(
                    255,
                    255,
                    167,
                    38,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //subject name
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Subject: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text: widget.syllabi.subject!.name!,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //class
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Class: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text: widget.syllabi.classes!.name!,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfScreen(
                      book:
                          'http://127.0.0.1:8000/storage/${widget.syllabi.content}',
                    ),
                  ),
                );
              },
              child: const Text(
                'Preview book',
                style: TextStyle(
                  color: Color.fromARGB(
                    255,
                    255,
                    167,
                    38,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
