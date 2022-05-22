import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/login.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(
                0Xff2bc3bb,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
