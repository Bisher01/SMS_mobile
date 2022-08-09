import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../components/components.dart';
import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../../utill/widget_size.dart';
import '../screens.dart';

class ShowSyllabi extends StatefulWidget {
  final bool isStudent;
  const ShowSyllabi({required this.isStudent, Key? key}) : super(key: key);

  @override
  State<ShowSyllabi> createState() => _ShowSyllabiState();
}

class _ShowSyllabiState extends State<ShowSyllabi> {
  int? classId;
  @override
  initState() {
    int id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false)
        .getStudent(id)
        .then((value) {
      classId = value.data!.student![0].class_classroom!.class_id;
      Provider.of<AppProvider>(context, listen: false).getAllSyllabi(classId!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Syllabi",
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
                child: widget.isStudent
                    ? const StudentMainScreen()
                    : const ParentMainScreen(),
              ),
            );
          },
        ),
      ),
      body: Consumer<AppProvider>(builder: (context, provider, child) {
        if (provider.fSyllabiResponse != null) {
          switch (provider.fSyllabiResponse?.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.COMPLETED:
              return GridView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                itemCount: provider.fSyllabiResponse!.data!.syllabi!.length,
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
                      child: SyllabiCard(
                        syllabi:
                            provider.fSyllabiResponse!.data!.syllabi![index],
                      ),
                    ),
                  );
                },
              );
            case Status.ERROR:
              return Error(
                errorMsg: provider.fSyllabiResponse!.message!,
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
