import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/components.dart';
import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../../utill/widget_size.dart';

class StudentShowOnlineClass extends StatefulWidget {
  const StudentShowOnlineClass({ Key? key}) : super(key: key);

  @override
  State<StudentShowOnlineClass> createState() => _StudentShowOnlineClassState();
}

class _StudentShowOnlineClassState extends State<StudentShowOnlineClass> {
  int? classId;
  int? classroomId;
  @override
  initState() {
    int id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false)
        .getStudent(id)
        .then((value) {
      classId = value.data!.student![0].class_classroom!.class_id;
      classroomId = value.data!.student![0].class_classroom!.classroom_id;
      Provider.of<AppProvider>(context, listen: false)
          .getStudentOnlineClass(classId!, classroomId!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Student's online classes",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<AppProvider>(builder: (context, provider, child) {
        if (provider.getStudentOnlineClassResponse != null) {
          switch (provider.getStudentOnlineClassResponse?.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.COMPLETED:
              return GridView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                itemCount: provider.getStudentOnlineClassResponse!.data!.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: widgetSize.getWidth(200, context) /
                      widgetSize.getHeight(200, context),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: widgetSize.getWidth(200, context),
                      height: widgetSize.getHeight(400, context),
                      child: StudentOnlineClassCard(
                        onlineClass:
                            provider.getStudentOnlineClassResponse!.data!.data![index],
                      ),
                    ),
                  );
                },
              );
            case Status.ERROR:
              return Error(
                errorMsg: provider.getStudentOnlineClassResponse!.message!,
              );
            default:
              return Container();
          }
        }
        return Container();
      }),
    );
  }
}
