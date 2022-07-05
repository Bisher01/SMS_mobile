import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/providers/providers.dart';
import '../services/api_response.dart';
import '../utill/utill.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  late final FocusNode _firstNameFocusNode;
  late final FocusNode _lastNameFocusNode;
  late final FocusNode _codeFocusNode;

  @override
  void initState() {
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _codeFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: widgetSize.getWidth(200, context),
                height: widgetSize.getHeight(200, context),
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
                            controller: _firstNameController,
                            focusNode: _firstNameFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            textDirection: TextDirection.ltr,
                            showCursor: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'First Name',
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
                            controller: _lastNameController,
                            focusNode: _lastNameFocusNode,
                            keyboardType: TextInputType.visiblePassword,
                            textDirection: TextDirection.ltr,
                            showCursor: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Last Name',
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
                            controller: _codeController,
                            focusNode: _codeFocusNode,
                            keyboardType: TextInputType.visiblePassword,
                            textDirection: TextDirection.ltr,
                            showCursor: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Code',
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
                    SizedBox(
                      width: widgetSize.getWidth(140, context),
                      height: widgetSize.getHeight(60, context),
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
                        onPressed: () async {
                          //Focus.of(context).unfocus();
                          if (await Provider.of<AppProvider>(context,
                                  listen: false)
                              .checkInternet()) {
                            var response = await Provider.of<AppProvider>(context, listen: false)
                                .login(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _codeController.text).then((value){
                                      if(value.data!.role == 'teacher'){
                                        Provider.of<AppProvider>(context, listen: false).getTeacher(value.data!.id!);
                                      }
                                      else if(value.data!.role == 'student'){
                                        Provider.of<AppProvider>(context, listen: false).getStudent(value.data!.id!);
                                      }
                                      else if(value.data!.role == 'mentor'){
                                        Provider.of<AppProvider>(context, listen: false).getMentor(value.data!.id!);
                                      }else{

                                      }
                            });
                            if(response.status == Status.COMPLETED ){
                              if(response.data!=null && response.data!.status!){
                                Navigator.pushNamed(context, '/schedule');
                              }

                            }

                          }

                        },
                        child: const Text(
                          'Log In',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _codeFocusNode.dispose();
    super.dispose();
  }
}
