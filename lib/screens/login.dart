import 'package:flutter/material.dart';
import '../utill/utill.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var containerWidth = widgetSize.getWidth(400, context);
    var containerHeight = widgetSize.getHeight(600, context);
    return Scaffold(
      //backgroundColor: const Color(0Xff2BC3BB),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/mount.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: containerWidth,
            height: containerHeight,
            //color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  width: containerWidth / 2,
                  height: containerHeight / 3,
                  child: SvgPicture.asset(
                    'assets/login.svg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome to our system',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              focusNode: _emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              textDirection: TextDirection.ltr,
                              showCursor: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff007D77,
                                    ),
                                  ),
                                ),
                              ),
                              cursorColor: const Color(0Xff007D77),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              keyboardType: TextInputType.visiblePassword,
                              textDirection: TextDirection.ltr,
                              showCursor: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff2BC3BB,
                                    ),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(
                                      0Xff007D77,
                                    ),
                                  ),
                                ),
                              ),
                              cursorColor: const Color(0Xff007D77),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20,
                              ),
                            ),
                          ),
                          elevation: 3,
                          fixedSize: Size(
                            containerWidth / 2 - containerWidth / 5,
                            containerHeight / 17,
                          ),
                          primary: const Color(
                            0Xff2BC3BB,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Log In',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
