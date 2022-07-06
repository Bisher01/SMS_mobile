import 'package:flutter/material.dart';
import '';
import '../../components/components.dart';


class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LiteRollingSwitch(onSwipe: (){}, onDoubleTap: (){}, onChanged: (val) {  }, onTap: (){},),
    );
  }
}
