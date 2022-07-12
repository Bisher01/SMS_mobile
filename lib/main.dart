import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/providers/providers.dart';
import 'package:sms_mobile/screens/screens.dart';
import 'package:sms_mobile/screens/student/quiz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<bool>('local');
  await Hive.openBox<String>('auth');
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
    if(token != 'error' && token!='' && token!=null)
      isToken = true;
    else
      isToken = false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: !isToken?'/login':'/schedule',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/schedule': (context) => const Schedule(),
          '/quiz': (context) => const Quiz(),
          '/exam_schedule':(context) => const ExamSchedule(),
        },
      ),
    );
  }
}
