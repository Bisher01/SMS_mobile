import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sms_mobile/providers/providers.dart';
import '../../services/api_response.dart';
import '../../utill/widget_size.dart';
import '../screens.dart';
import '../../components/error.dart' as er;

class ParentProfilePage extends StatefulWidget {
  const ParentProfilePage({Key? key}) : super(key: key);

  @override
  State<ParentProfilePage> createState() => _ParentProfilePageState();
}

class _ParentProfilePageState extends State<ParentProfilePage> {
  @override
  initState() {
    final id = Provider.of<AppProvider>(context, listen: false).getId();
    Provider.of<AppProvider>(context, listen: false).getParent(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Parent Profile'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTopJoined,
                childCurrent: widget,
                duration: const Duration(milliseconds: 300),
                child: const ParentMainScreen(),
              ),
            );
          },
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          if (provider.getParentResponse != null) {
            switch (provider.getParentResponse?.status) {
              case Status.LOADING:
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child:  CircularProgressIndicator(color: Colors.orange[400],),
                );
              case Status.ERROR:
                return er.Error(
                  errorMsg: provider.getParentResponse!.message!,
                );
              case Status.COMPLETED:
                final parent = provider.getParentResponse!.data!.parent![0];
                return Stack(
                  children: [
                    Container(
                      height: widgetSize.getHeight(500, context),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: const AssetImage(
                            'assets/jj.jpg',
                          ),
                          colorFilter: ColorFilter.mode(
                            Colors.black54.withOpacity(0.8),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      // child: Image.asset(
                      //   widget.teacher.picture!,
                      // ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: widgetSize.getHeight(
                          250,
                          context,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              35,
                            ),
                            topRight: Radius.circular(
                              35,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            // top: widgetSize.getHeight(
                            //   30,
                            //   context,
                            // ),
                          ),
                          child: ListView(
                            children: [
                              const Text(
                                "Parent's Information",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //email
                              Text(
                                "Email: ${parent.email}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //code
                              Text(
                                "Code: ${parent.code}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Personal info ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //father
                              Text(
                                "Father's name: ${parent.father_name} ",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //mother
                              Text(
                                "Mother's name: ${parent.mother_name} ",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              //Phone
                              Text(
                                "Phone: ${parent.phone} ",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Work info ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //Job
                              Text(
                                "Job: ${parent.jop}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 240,
                      right: 100,
                      child: Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          'Parents',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: widgetSize.getHeight(
                          190,
                          context,
                        ),
                        left: 45,
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/jj.jpg',
                        ),
                        radius: 60,
                      ),
                    ),
                  ],
                );
              default:
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,

                  ///TODO: change
                  child: Container(),
                );
            }
          }
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,

            ///TODO: change
            child: Container(),
          );
        },
      ),
    );
  }
}
