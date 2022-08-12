import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/providers/providers.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../models/models.dart';
import '../services/api_response.dart';

class AddOralMarkCard extends StatefulWidget {
  final Student student;
  final int subjectId;
  final int classId;
  final int classroomId;
  const AddOralMarkCard(
      {required this.classroomId,
      required this.classId,
      required this.subjectId,
      required this.student,
      Key? key})
      : super(key: key);

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
    List<String> dropDownItems = ['Season 1', 'Season 2'];
    String? dropDownValue;
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
            FadeInImage(
              height: widgetSize.getHeight(190, context),
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/student.png'),
              image: NetworkImage(
                  'http://127.0.0.1:8000/storage/${widget.student.picture}'),
              imageErrorBuilder: (context, error, stackTrace) {
                return Container(child: Image.asset("assets/student.png"));
              },
            ),
            // Image.network(
            //   'http://127.0.0.1:8000/storage/${widget.student.picture!}',
            //   fit: BoxFit.cover,
            //   height: widgetSize.getHeight(190, context),
            //   width: double.infinity,
            // ),
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
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Oral marks',
                            ),
                            SizedBox(
                              width: 100,
                              height: 60,
                              child: DropdownButtonFormField<String>(
                                  iconEnabledColor: Colors.orange,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Season',
                                  ),
                                  value: dropDownValue,
                                  elevation: 16,
                                  onSaved: (String? newValue) {
                                    setState(() {
                                      dropDownValue = newValue ?? 'Season';
                                    });
                                  },
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropDownValue = newValue ?? 'Season';
                                    });
                                  },
                                  items: dropDownItems.map((e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList()),
                            ),
                          ],
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.start,
                                controller: _markController,
                                focusNode: _markFocusNode,
                                textDirection: TextDirection.ltr,
                                showCursor: true,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 19),
                                  hintText: 'Oral mark',
                                  border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.orange),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.orange),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.orange),
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
                                        color: Colors.orange),
                                  ),
                                ),
                                cursorColor: Colors.orange[200],
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
                            onPressed: () async {
                              _markFocusNode.unfocus();
                              final provider = Provider.of<AppProvider>(context,
                                  listen: false);
                              final teacherId = provider.getId();
                              if (await provider.checkInternet()) {
                                try {
                                  int mark = int.parse(_markController.text);
                                  int seasonId =
                                      dropDownValue == dropDownItems[0] ? 1 : 2;
                                  var response = await Provider.of<AppProvider>(
                                          context,
                                          listen: false)
                                      .addStudentOralMark(
                                          teacherId,
                                          widget.subjectId,
                                          widget.classId,
                                          widget.classroomId,
                                          widget.student.id!,
                                          seasonId,
                                          mark);

                                  if (response.status == Status.LOADING) {
                                    EasyLoading.showToast(
                                      'Loading...',
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                    );
                                  }
                                  if (response.status == Status.ERROR) {
                                    EasyLoading.showError(response.message!,
                                        dismissOnTap: true);
                                  }
                                  if (response.status == Status.COMPLETED) {
                                    if (response.data != null &&
                                        response.data!.status!) {
                                      EasyLoading.showSuccess(
                                          response.data!.message!,
                                          dismissOnTap: true);
                                      Navigator.of(context).pop();
                                    } else {
                                      EasyLoading.showError(
                                          response.data!.message!,
                                          dismissOnTap: true);
                                      Navigator.of(context).pop();
                                    }
                                  }
                                } catch (e) {
                                  EasyLoading.showError(
                                      'the mark must be numbers only',
                                      dismissOnTap: true);
                                }
                              }
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
