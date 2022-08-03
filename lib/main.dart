import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/models/resultant.dart';
import 'package:sms_mobile/providers/providers.dart';
import 'package:sms_mobile/screens/mentor/attendance.dart';
import 'package:sms_mobile/screens/screens.dart';
import 'package:sms_mobile/screens/student/exam.dart' as ex;
import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';
import 'package:sms_mobile/screens/student/exam_schedule.dart' as ex;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<bool>('local');
  await Hive.openBox<String>('auth');
  await Hive.openBox<String>('role');
  await Hive.openBox<int>('id');
  await Hive.openBox<bool>('welcome');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Boxes.getAuthBox();
    String? token = box.get('token');
    bool isToken;
    bool? isFirst = Boxes.getWelcomeBox().get('welcome');
    isFirst ??= false;
    if (token != 'error' && token != '' && token != null) {
      isToken = true;
    } else {
      isToken = false;
    }
    var box1 = Boxes.getRoleBox();
    String? role = box1.get('role');
    //print(role);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: MentorAttendanceScreen(),
        // home: !isFirst
        //     ? const WelcomeScreen()
        //     : !isToken
        //         ? const LoginScreen()
        //         : role == 'teacher'
        //             ? const TeacherMainScreen()
        //             : role == 'parent'
        //                 ? const ParentMainScreen()
        //                 : role == 'student'
        //                     ? const StudentMainScreen()
        //                     : role == 'mentor'
        //                         ? const MentorMainScreen()
        //                         : const MainScreen(),
      ),
    );
  }
}
