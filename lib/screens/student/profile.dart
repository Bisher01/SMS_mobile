import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sms_mobile/screens/screens.dart';
import 'package:sms_mobile/utill/utill.dart';
import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../../components/error.dart' as er;

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  initState() {
    final id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false).getStudent(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Student Profile'),
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
                child: const StudentMainScreen(),
              ),
            );
          },
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          if (provider.getStudentResponse != null) {
            switch (provider.getStudentResponse?.status) {
              case Status.LOADING:
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child:  CircularProgressIndicator(color: Colors.orange[400],),
                );
              case Status.ERROR:
                return er.Error(
                  errorMsg: provider.getStudentResponse!.message!,
                );
              case Status.COMPLETED:
                final student = provider.getStudentResponse!.data!.student![0];
                return Stack(
                  children: [
                    Container(
                      height: widgetSize.getHeight(500, context),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'http://127.0.0.1:8000/storage${student.picture!}',
                          ),
                          colorFilter: ColorFilter.mode(
                            Colors.black54.withOpacity(0.8),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      // child: Image.asset(
                      //   widget.teacher.picture!,
                      // ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: widgetSize.getHeight(
                          250,
                          context,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              35,
                            ),
                            topRight: Radius.circular(
                              35,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            // top: widgetSize.getHeight(
                            //   30,
                            //   context,
                            // ),
                          ),
                          child: ListView(
                            children: [
                              const Text(
                                "Student's Information",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //email
                              Text(
                                "Email: ${student.email}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //code
                              Text(
                                "Code: ${student.code}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Parent's info ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //National number
                              Text(
                                "National number: ${student.parent!.national_number!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //Town
                              Text(
                                "Email: ${student.parent!.email!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //Code
                              Text(
                                "Code: ${student.parent!.code!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //father
                              Text(
                                "Father's name: ${student.parent!.father_name!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //mother
                              Text(
                                "Mother's name: ${student.parent!.mother_name!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //job
                              Text(
                                "Job: ${student.parent!.jop!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //phone
                              Text(
                                "Phone: ${student.parent!.phone!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Address ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //City
                              Text(
                                "City: ${student.address!.city!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //Town
                              Text(
                                "Town: ${student.address!.town!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //Street
                              Text(
                                "Street: ${student.address!.street!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "School related info ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //birthdate
                              Text(
                                "Birthdate: ${student.birthdate}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //grade
                              Text(
                                "Grade: ${student.grade!.name!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //class
                              Text(
                                "Class: ${student.class_classroom!.classes!.name}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //classroom
                              Text(
                                "Classroom: ${student.class_classroom!.classrooms!.name.toString()}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Personal info ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //Gender
                              Text(
                                "Gender: ${student.gender!.id!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //Religion
                              Text(
                                "Religion: ${student.religion!.name!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //nationality
                              Text(
                                "Nationality: ${student.nationality!.name!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //blood
                              Text(
                                "Blood type: ${student.blood!.type!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 240,
                      right: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              "${student.f_name} ${student.l_name}",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              'Student',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: widgetSize.getHeight(
                            190,
                            context,
                          ),
                          left: 45),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          'http://127.0.0.1:8000/storage${student.picture!}',
                        ),
                        radius: 60,
                      ),
                    ),
                  ],
                );
              default:
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,

                  ///TODO: change
                  child: Container(),
                );
            }
          }
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,

            ///TODO: change
            child: Container(),
          );
        },
      ),
    );
  }
}
