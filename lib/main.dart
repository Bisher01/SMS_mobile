import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/providers/providers.dart';
import 'package:sms_mobile/screens/screens.dart';
import 'package:sms_mobile/screens/student/quiz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';

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

  // This widget is the root of your application.
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: TeacherProfilePage(
          teacher: Teacher(
            picture: 'assets/jj.jpg',
            f_name: 'jooudi',
            l_name: 'kab',
            code: '0019203043',
            email: 'jjj@g.co',
            salary: '200000',
            joining_date: '20-9-2020',
            address_id: 1,
            religion_id: 1,
            gender_id: 1,
            grade_id: 1,
            id: 1,
          ),
        ),
        // home: !isFirst
        //     ? const WelcomeScreen()
        //     : !isToken
        //         ? const LoginScreen()
        //         : const MainScreen(),
      ),
    );
  }
}
