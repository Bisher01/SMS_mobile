import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sms_mobile/models/models.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:sms_mobile/providers/app_provider.dart';
import 'package:sms_mobile/screens/screens.dart';
import '../../components/error.dart' as err;

import '../../services/api_response.dart';

class Cell extends StatelessWidget {
  final dynamic value;
  final Color? color;
  const Cell({
    Key? key,
    this.value,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '${value ?? ''}',
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}

class Head extends StatelessWidget {
  final List<String> head = [
    "Full mark",
    "quiz",
    "Exam",
    "Test",
    "Oral",
    "Total mark"
  ];
  final ScrollController? scrollController;
  Head({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      height: 80,
      child: Row(
        children: [
          Cell(
            color: Colors.yellow.withOpacity(0.3),
            value: "Subject",
          ),
          Expanded(
            child: Container(
              color: Colors.yellowAccent,
              child: ListView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(6, (index) {
                  return Cell(
                    color: Colors.yellow.withOpacity(0.3),
                    value: head[index],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  final ScrollController? scrollController;
  final int studentId;
  const Body({
    Key? key,
    required this.studentId,
    required this.scrollController,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  initState() {
    Provider.of<AppProvider>(context, listen: false).getStudentResultant(widget.studentId, 1);
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers!.addAndGet();
    _restColumnsController = _controllers!.addAndGet();
    super.initState();
  }

  LinkedScrollControllerGroup? _controllers;
  ScrollController? _firstColumnController;
  ScrollController? _restColumnsController;

  @override
  void dispose() {
    _firstColumnController!.dispose();
    _restColumnsController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        if (provider.getStudentResultantResponse != null) {
          var response = provider.getStudentResultantResponse;
          switch (response?.status) {
            case Status.LOADING:
              return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: CircularProgressIndicator(
                    color: Colors.orange[400],
                  ));
            case Status.ERROR:
              return err.Error(
                errorMsg: response!.message!,
              );
            case Status.COMPLETED:
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.tealAccent,
                    width: 80,
                    child: ListView(
                      controller: _firstColumnController,
                      physics: const ClampingScrollPhysics(),
                      children: List.generate(response!.data!.resultant!.length,
                          (index) {
                        return Cell(
                          color: Colors.black.withOpacity(0.3),
                          value: response.data!.resultant![index].subjectName,
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: widget.scrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      child: Container(
                        color: Colors.pinkAccent,
                        width: (6) * 80,
                        child: ListView(
                          controller: _restColumnsController,
                          physics: const ClampingScrollPhysics(),
                          children: List.generate(
                              response.data!.resultant!.length, (y) {
                            return Row(
                              children: List.generate(6, (x) {
                                return Cell(
                                  color: Colors.purple,
                                  value: x == 0
                                      ? response.data!.resultant![y].subjectMark
                                      : x == 1
                                          ? response.data!.resultant![y].quize
                                          : x == 2
                                              ? response
                                                  .data!.resultant![y].exam
                                              : x == 3
                                                  ? response
                                                      .data!.resultant![y].test
                                                  : x == 4
                                                      ? response
                                                          .data!
                                                          .resultant![y]
                                                          .oralTest
                                                      : response
                                                          .data!
                                                          .resultant![y]
                                                          .totalMark,
                                );
                              }),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              );
          }
        }
        return Container();
      },
    );
  }
}

class Resultants extends StatefulWidget {
  final int studentId;
  final bool isParent;
  const Resultants({required this.studentId,required this.isParent,Key? key}) : super(key: key);

  @override
  _ResultantsState createState() => _ResultantsState();
}

class _ResultantsState extends State<Resultants> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _headController;
  ScrollController? _bodyController;
  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers!.addAndGet();
    _bodyController = _controllers!.addAndGet();
  }

  @override
  void dispose() {
    _headController!.dispose();
    _bodyController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Resultants'),
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
                child: widget.isParent?const ParentMainScreen():const StudentMainScreen(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Head(
              scrollController: _headController,
            ),
            Expanded(
              child: Body(
                studentId: widget.studentId,
                scrollController: _bodyController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
