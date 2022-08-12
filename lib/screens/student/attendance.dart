import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sms_mobile/utill/utill.dart';

import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../../components/components.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<StudentAttendanceScreen> createState() =>
      _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  @override
  initState() {
    int id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false).getStudentAttendances(id);
    super.initState();
  }

  // List<StudentAttendance> attendance = [];
  // int? classRoomDDV;
  // Map<int, int> classrooms = {};
  // int selectedClassroom = 1;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      if (provider.getStudentAttendancesResponse != null) {
        switch (provider.getStudentAttendancesResponse!.status) {
          case Status.LOADING:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.orange[400],
                ),
              ),
            );
          case Status.COMPLETED:
            {
              // for (int i = 0;
              //     i < provider.mentorClassesResponse!.data!.mentorData!.length;
              //     i++) {
              //   classrooms[provider.mentorClassesResponse!.data!.mentorData![i]
              //       .classRoomId!] = i;
              // }
              return Scaffold(
                extendBodyBehindAppBar: false,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    "Attendance",
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 3.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: provider.getStudentAttendancesResponse!.data!
                        .data![0].attendances!.length,
                    // .mentorData![selectedClassroom].students!.length,
                    itemBuilder: (context, index) {
                      // attendance.add(StudentAttendance(id: 1, status: 0));
                      return Card(
                        elevation: 2,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: FadeInImage(
                                    fit: BoxFit.cover,
                                    placeholder: const AssetImage('assets/student.png'),
                                    image: NetworkImage(
                                        'http://127.0.0.1:8000/storage/${provider.getStudentAttendancesResponse!.data!.data![0].picture}'),
                                    imageErrorBuilder: (context, error, stackTrace) {
                                      return Container(
                                          child: Image.asset("assets/student.png"));
                                    },
                                  ),
                                ),
                                Text(
                                  '${provider.getStudentAttendancesResponse!.data!.data![0].f_name} ${provider.getStudentAttendancesResponse!.data!.data![0].l_name}',
                                  //'${provider.mentorClassesResponse!.data!.mentorData![selectedClassroom].students![index].f_name!} ${provider.mentorClassesResponse!.data!.mentorData![classrooms[classRoomDDV]!].students![index].l_name!}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'ChakraPetch',
                                  ),
                                ),
                                const SizedBox(),
                                Text(
                                  ' ${provider.getStudentAttendancesResponse!.data!.data![0].attendances![index].attendance!.date}',
                                  //'${provider.mentorClassesResponse!.data!.mentorData![selectedClassroom].students![index].f_name!} ${provider.mentorClassesResponse!.data!.mentorData![classrooms[classRoomDDV]!].students![index].l_name!}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'ChakraPetch',
                                  ),
                                ),
                                const SizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: provider
                                                        .getStudentAttendancesResponse!
                                                        .data!
                                                        .data![0]
                                                        .attendances![index]
                                                        .statusId ==
                                                    1
                                                ? ColorResources.green
                                                : Colors.grey[300]!,
                                            width: 2),
                                        color: provider
                                                    .getStudentAttendancesResponse!
                                                    .data!
                                                    .data![0]
                                                    .attendances![index]
                                                    .statusId ==
                                                1
                                            ? ColorResources.green
                                            : Colors.grey[100],
                                      ),
                                      constraints: const BoxConstraints.expand(
                                        width: 45,
                                        height: 45,
                                      ),
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                            'P',
                                            style: TextStyle(
                                              color: provider
                                                          .getStudentAttendancesResponse!
                                                          .data!
                                                          .data![0]
                                                          .attendances![index]
                                                          .statusId ==
                                                      1
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: provider
                                                          .getStudentAttendancesResponse!
                                                          .data!
                                                          .data![0]
                                                          .attendances![index]
                                                          .statusId ==
                                                      1
                                                  ? 23
                                                  : 20,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'ChakraPetch',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // InkWell(
                                    //   overlayColor: MaterialStateProperty.all(
                                    //       Colors.transparent),
                                    //   onTap: () {
                                    //     setState(() {
                                    //       attendance[index].status = 1;
                                    //     });
                                    //   },
                                    //   child: AnimatedContainer(
                                    //     duration:
                                    //         const Duration(milliseconds: 300),
                                    //     decoration: BoxDecoration(
                                    //       shape: BoxShape.circle,
                                    //       border: Border.all(
                                    //           color:
                                    //               attendance[index].status == 1
                                    //                   ? ColorResources.green
                                    //                   : Colors.grey[300]!,
                                    //           width: 2),
                                    //       color: attendance[index].status == 1
                                    //           ? ColorResources.green
                                    //           : Colors.grey[100],
                                    //     ),
                                    //     constraints:
                                    //         const BoxConstraints.expand(
                                    //       width: 45,
                                    //       height: 45,
                                    //     ),
                                    //     child: Center(
                                    //       child: FittedBox(
                                    //         fit: BoxFit.contain,
                                    //         child: Text(
                                    //           'P',
                                    //           style: TextStyle(
                                    //             color:
                                    //                 attendance[index].status ==
                                    //                         1
                                    //                     ? Colors.white
                                    //                     : Colors.black,
                                    //             fontSize:
                                    //                 attendance[index].status ==
                                    //                         1
                                    //                     ? 23
                                    //                     : 20,
                                    //             fontWeight: FontWeight.w700,
                                    //             fontFamily: 'ChakraPetch',
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: provider
                                                          .getStudentAttendancesResponse!
                                                          .data!
                                                          .data![0]
                                                          .attendances![index]
                                                          .statusId ==
                                                      2
                                                  ? const Color.fromRGBO(
                                                      227, 85, 112, 1)
                                                  : Colors.grey[300]!,
                                              width: 2),
                                          color: provider
                                                      .getStudentAttendancesResponse!
                                                      .data!
                                                      .data![0]
                                                      .attendances![index]
                                                      .statusId ==
                                                  2
                                              ? const Color.fromRGBO(
                                                  227, 85, 112, 1)
                                              : Colors.grey[100],
                                        ),
                                        constraints:
                                            const BoxConstraints.expand(
                                          width: 45,
                                          height: 45,
                                        ),
                                        child: Center(
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              'A',
                                              style: TextStyle(
                                                color: provider
                                                            .getStudentAttendancesResponse!
                                                            .data!
                                                            .data![0]
                                                            .attendances![index]
                                                            .statusId ==
                                                        2
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: provider
                                                            .getStudentAttendancesResponse!
                                                            .data!
                                                            .data![0]
                                                            .attendances![index]
                                                            .statusId ==
                                                        2
                                                    ? 23
                                                    : 20,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'ChakraPetch',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 8.0),
                                    //   child: InkWell(
                                    //     overlayColor: MaterialStateProperty.all(
                                    //         Colors.transparent),
                                    //     onTap: () {
                                    //       setState(() {
                                    //         attendance[index].status = 2;
                                    //       });
                                    //     },
                                    //     child: AnimatedContainer(
                                    //       duration:
                                    //           const Duration(milliseconds: 300),
                                    //       decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         border: Border.all(
                                    //             color:
                                    //                 attendance[index].status ==
                                    //                         2
                                    //                     ? const Color.fromRGBO(
                                    //                         227, 85, 112, 1)
                                    //                     : Colors.grey[300]!,
                                    //             width: 2),
                                    //         color: attendance[index].status == 2
                                    //             ? const Color.fromRGBO(
                                    //                 227, 85, 112, 1)
                                    //             : Colors.grey[100],
                                    //       ),
                                    //       constraints:
                                    //           const BoxConstraints.expand(
                                    //         width: 45,
                                    //         height: 45,
                                    //       ),
                                    //       child: Center(
                                    //         child: FittedBox(
                                    //           fit: BoxFit.contain,
                                    //           child: Text(
                                    //             'A',
                                    //             style: TextStyle(
                                    //               color: attendance[index]
                                    //                           .status ==
                                    //                       2
                                    //                   ? Colors.white
                                    //                   : Colors.black,
                                    //               fontSize: attendance[index]
                                    //                           .status ==
                                    //                       2
                                    //                   ? 23
                                    //                   : 20,
                                    //               fontWeight: FontWeight.w700,
                                    //               fontFamily: 'ChakraPetch',
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: provider
                                                        .getStudentAttendancesResponse!
                                                        .data!
                                                        .data![0]
                                                        .attendances![index]
                                                        .statusId ==
                                                    3
                                                ? Colors.orange[400]!
                                                : Colors.grey[300]!,
                                            width: 2),
                                        color: provider
                                                    .getStudentAttendancesResponse!
                                                    .data!
                                                    .data![0]
                                                    .attendances![index]
                                                    .statusId ==
                                                3
                                            ? Colors.orange[400]
                                            : Colors.grey[100],
                                      ),
                                      constraints: const BoxConstraints.expand(
                                        width: 45,
                                        height: 45,
                                      ),
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                            'L',
                                            style: TextStyle(
                                              color: provider
                                                          .getStudentAttendancesResponse!
                                                          .data!
                                                          .data![0]
                                                          .attendances![index]
                                                          .statusId ==
                                                      3
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: provider
                                                          .getStudentAttendancesResponse!
                                                          .data!
                                                          .data![0]
                                                          .attendances![index]
                                                          .statusId ==
                                                      3
                                                  ? 23
                                                  : 20,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'ChakraPetch',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // InkWell(
                                    //   overlayColor: MaterialStateProperty.all(
                                    //       Colors.transparent),
                                    //   onTap: () {
                                    //     setState(() {
                                    //       attendance[index].status = 3;
                                    //     });
                                    //   },
                                    //   child: AnimatedContainer(
                                    //     duration:
                                    //         const Duration(milliseconds: 300),
                                    //     decoration: BoxDecoration(
                                    //       shape: BoxShape.circle,
                                    //       border: Border.all(
                                    //           color:
                                    //               attendance[index].status == 3
                                    //                   ? Colors.orange[400]!
                                    //                   : Colors.grey[300]!,
                                    //           width: 2),
                                    //       color: attendance[index].status == 3
                                    //           ? Colors.orange[400]
                                    //           : Colors.grey[100],
                                    //     ),
                                    //     constraints:
                                    //         const BoxConstraints.expand(
                                    //       width: 45,
                                    //       height: 45,
                                    //     ),
                                    //     child: Center(
                                    //       child: FittedBox(
                                    //         fit: BoxFit.contain,
                                    //         child: Text(
                                    //           'L',
                                    //           style: TextStyle(
                                    //             color:
                                    //                 attendance[index].status ==
                                    //                         3
                                    //                     ? Colors.white
                                    //                     : Colors.black,
                                    //             fontSize:
                                    //                 attendance[index].status ==
                                    //                         3
                                    //                     ? 23
                                    //                     : 20,
                                    //             fontWeight: FontWeight.w700,
                                    //             fontFamily: 'ChakraPetch',
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }
          case Status.ERROR:
            return Error(errorMsg: provider.mentorClassesResponse!.message!);
          default:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.orange[400],
                ),
              ),
            );
        }
      } else {
        return Container();
      }
    });
  }
}
