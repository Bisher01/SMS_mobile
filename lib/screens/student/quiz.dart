import 'package:flutter/material.dart';
import '';
import '../../components/components.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool val = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LiteRollingSwitch(
              onSwipe: () {},
              onDoubleTap: () {},
              onChanged: (val) {},
              onTap: () {},
              value: val,
              textOn: 'disponible',
              textOff: 'ocupado',
              colorOn: Colors.greenAccent[700]!,
              colorOff: Colors.redAccent[700]!,
              iconOn: Icons.done,
              iconOff: Icons.remove_circle_outline,
              textSize: 16.0,
            ),
            LiteRollingSwitch(
              onSwipe: () {},
              onDoubleTap: () {},
              onChanged: (val) {},
              onTap: () {
                setState((){
                  val = false;
                  print(val);
                });
              },
              value: false,
              textOn: 'disponible',
              textOff: 'ocupado',
              colorOn: Colors.greenAccent[700]!,
              colorOff: Colors.redAccent[700]!,
              iconOn: Icons.done,
              iconOff: Icons.remove_circle_outline,
              textSize: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
