import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/screens/teacher/new_meeting.dart';
import '../../components/components.dart';
import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../../utill/widget_size.dart';
import '../screens.dart';

class TeacherShowOnlineClass extends StatefulWidget {
  const TeacherShowOnlineClass({Key? key}) : super(key: key);

  @override
  State<TeacherShowOnlineClass> createState() => _TeacherShowOnlineClassState();
}

class _TeacherShowOnlineClassState extends State<TeacherShowOnlineClass> {
  @override
  initState() {
    int id = Provider.of<AppProvider>(context, listen: false).getId();

    Provider.of<AppProvider>(context, listen: false).getTeacherOnlineClass(id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Teacher's online classes",
          style: TextStyle(
            fontSize: 16,
          ),
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
                  child: const TeacherMainScreen()),
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewMeeting()));
              },
              icon: const Icon(
                Icons.add,
              )),
        ],
      ),
      body: Consumer<AppProvider>(builder: (context, provider, child) {
        if (provider.getTeacherOnlineClassResponse != null) {
          switch (provider.getTeacherOnlineClassResponse?.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.COMPLETED:
              return GridView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                itemCount:
                    provider.getTeacherOnlineClassResponse!.data!.data!.length,
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
                      child: TeacherOnlineClassCard(
                        onlineClass: provider
                            .getTeacherOnlineClassResponse!.data!.data![index],
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
