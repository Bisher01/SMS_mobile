import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sms_mobile/utill/widget_size.dart';
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

  @override
  Widget build(BuildContext context) {
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
                        Visibility(
                          visible: isLast,
                          child: Padding(
                            padding: const EdgeInsets.only(top:12.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                ),
                                elevation: 3,
                                primary: const Color(
                                  0Xff2BC3BB,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                              child: const Text(
                                'Continue to login',
                              ),
                            ),
                          ),
                        )
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
          slides.length ,
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

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: slides.length ,
            itemBuilder: (BuildContext context, int index) {
              _pageViewController.addListener(() {
                setState(() {
                  currentPage = _pageViewController.page!;
                  if (currentPage == 3 ) {
                    isLast = true;
                  } if (currentPage < 3 ){
                    isLast = false;
                  }
                });
              });
              return slides[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 70.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: SmoothPageIndicator(
                controller: _pageViewController, count: 4,
                effect: WormEffect(
                  activeDotColor: const Color(
                    0XFF256075,
                  ),
                  dotColor: const Color(
                    0XFF256075,
                  ).withOpacity(0.2),
                  paintStyle: PaintingStyle.fill,
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 14,

                ),

                onDotClicked: (index){
                  setState((){
                    _pageViewController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    currentPage=index as double;
                  });
                },

              )
            ),
          ),
        ],
      ),
    );
  }
}
