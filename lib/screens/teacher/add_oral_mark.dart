import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../providers/providers.dart';
import '../../services/api_response.dart';
import '../../utill/utill.dart';
import '../../components/components.dart';
import '../../models/models.dart';
import '../screens.dart';
import '../../screens/student/exam_schedule.dart' as ex;

class AddOralMark extends StatefulWidget {
  final int subjectId;
  final int classId;
  final int classroomId;
  const AddOralMark(
      {required this.subjectId,
      required this.classId,
      required this.classroomId,
      Key? key})
      : super(key: key);

  @override
  State<AddOralMark> createState() => _AddOralMarkState();
}

class _AddOralMarkState extends State<AddOralMark> {
  @override
  initState() {
    int id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false)
        .getTeacherStudents(id, widget.subjectId, widget.classId, widget.classroomId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Choose student',
          ),
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
                  child: const ParentMainScreen(),
                ),
              );
            },
          ),
        ),
        body: Consumer<AppProvider>(builder: (context, provider, child) {
          if (provider.getTeacherStudentsResponse != null) {
            var response = provider.getTeacherStudentsResponse;
            switch (response?.status) {
              case Status.LOADING:
                return Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: CircularProgressIndicator(
                      color: Colors.orange[400],
                    ));
              case Status.ERROR:
                return Error(
                  errorMsg: response!.message!,
                );
              case Status.COMPLETED:
                return Container(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    itemCount: response!.data!.student!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: widgetSize.getWidth(200, context) /
                          widgetSize.getHeight(300, context),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AddOralMarkCard(
                          classroomId: widget.classroomId,
                          classId: widget.classId,
                          subjectId: widget.subjectId,
                          student: response.data!.student![index],
                        ),
                      );
                    },
                  ),
                );
              default:
                return Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Container());
            }
          }
          return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container());
        }),
      ),
    );
  }
}
