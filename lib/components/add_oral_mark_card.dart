import 'package:flutter/material.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../models/models.dart';

class AddOralMarkCard extends StatefulWidget {
  final Student student;
  const AddOralMarkCard({required this.student, Key? key}) : super(key: key);

  @override
  State<AddOralMarkCard> createState() => _AddOralMarkCardState();
}

class _AddOralMarkCardState extends State<AddOralMarkCard> {
  final TextEditingController _markController = TextEditingController();
  late final FocusNode _markFocusNode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _markFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            20,
          ),
          bottomRight: Radius.circular(
            20,
          ),
        ),
      ),
      width: widgetSize.getWidth(300, context),
      height: widgetSize.getHeight(300, context),
      child: Card(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/jj.jpg',
              fit: BoxFit.cover,
              height: widgetSize.getHeight(190, context),
              width: double.infinity,
            ),
            Text(
              "Name: ${widget.student.f_name} ${widget.student.l_name}",
              style: const TextStyle(color: Colors.black54),
            ),
            Container(
              color: Colors.orange[200],
              child: TextButton(
                child: const Text(
                  'Add oral mark',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Oral marks',
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Add oral mark for ${widget.student.f_name} ${widget.student.l_name}",
                            ),
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _markController,
                                focusNode: _markFocusNode,
                                keyboardType: TextInputType.number,
                                textDirection: TextDirection.ltr,
                                showCursor: true,
                                decoration:  const InputDecoration(
                                  hintText: 'Oral mark',
                                  border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.orange
                                    ),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.orange
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.orange
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.red,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.orange
                                    ),
                                  ),
                                ),
                                cursorColor:  Colors.orange[200],
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(primary: Colors.orange),
                            child: const Text(
                              'Close',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(primary: Colors.orange),
                            child: const Text('Submit'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _markFocusNode.dispose();
    super.dispose();
  }
}
