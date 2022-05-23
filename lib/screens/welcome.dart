import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/screens.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double currentPage = 0.0;
  bool isLast = false;
  final _pageViewController = PageController();
  List<Widget> slides = items
      .map(
        (item) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: SvgPicture.asset(
                  item['image'],
                  fit: BoxFit.fitWidth,
                  width: 220.0,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: Text(
                          item['header'],
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w300,
                            color: Color(0XFF3F3D56),
                            //height: 2.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          item['description'],
                          style: const TextStyle(
                              color: Colors.grey,
                              letterSpacing: 1.2,
                              fontSize: 16.0,
                              height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      .toList();
  List<Widget> indicator() => List<Widget>.generate(
        slides.length + 1,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: currentPage.round() == index
                ? const Color(
                    0XFF256075,
                  )
                : const Color(
                    0XFF256075,
                  ).withOpacity(
                    0.2,
                  ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: slides.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == slides.length) {
                isLast = true;
              } else {
                isLast = false;
              }
              _pageViewController.addListener(() {
                setState(() {
                  currentPage = _pageViewController.page!;
                });
              });
              if (!isLast)
                return slides[index];
              else
                return LoginScreen();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 70.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
