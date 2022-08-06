import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sms_mobile/models/models.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:sms_mobile/providers/app_provider.dart';
import 'package:sms_mobile/screens/screens.dart';
import '../../components/error.dart' as err;

import '../../services/api_response.dart';

class Cell extends StatelessWidget {
  final dynamic value;
  final Color? color;
  final Color? borderColor;
  final bool head;
  final bool top;
  const Cell({
    Key? key,
    this.value,
    this.color,
    this.borderColor,
    required this.head,
    required this.top,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: borderColor??Colors.black12,
          width: 1,
        ),
        borderRadius: top?BorderRadius.zero:BorderRadius.all(Radius.circular(10))
      ),
      alignment: Alignment.center,
      child: Text(
        '${value ?? ''}',
        style: head? TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.grey[800],
        ):const TextStyle(
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
      height: 100,
      child: Row(
        children: [
          Cell(
            value: "Subject",
            head: true,
            color: Colors.orange[400],
            top: true,
          ),
          Expanded(
            child: Container(
              child: ListView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(6, (index) {
                  return Cell(
                    value: head[index],
                    head: true,
                    top: true,
                    color: Colors.orange[400],
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
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange[400],
                ),
              );
            case Status.ERROR:
              return err.Error(
                errorMsg: response!.message!,
              );
            case Status.COMPLETED:
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 100,
                    child: ListView(
                      controller: _firstColumnController,
                      physics: const ClampingScrollPhysics(),
                      children: List.generate(response!.data!.resultant!.length,
                          (index) {
                        return Cell(
                          value: response.data!.resultant![index].subjectName,
                          color: Colors.orange[100],
                          top: false,
                          head: true,
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
                        width: (6) * 100,
                        child: ListView(
                          controller: _restColumnsController,
                          physics: const ClampingScrollPhysics(),
                          children: List.generate(
                              response.data!.resultant!.length, (y) {
                            return Row(
                              children: List.generate(6, (x) {
                                return Cell(
                                  top: true,
                                  head: false,
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
            default:
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange[400],
                ),
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
  const Resultants({required this.studentId, required this.isParent, Key? key})
      : super(key: key);

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

  List<String> seasons = ['Season 1', 'Season 2'];
  int seasonId = 0;
  String? selectedSeason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Resultants',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTopJoined,
                childCurrent: widget,
                duration: const Duration(milliseconds: 300),
                child: widget.isParent
                    ? const ParentMainScreen()
                    : const StudentMainScreen(),
              ),
            );
          },
        ),
        actions: [
          DropdownButton<String>(
              hint: const Text(
                'Season',
              ),
              value: selectedSeason,
              items: seasons
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedSeason = newValue ?? 'Season';
                  seasonId = seasons.indexOf(selectedSeason!)+1;
                  Provider.of<AppProvider>(context, listen: false)
                      .getStudentResultant(widget.studentId, seasonId);
                });
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
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
