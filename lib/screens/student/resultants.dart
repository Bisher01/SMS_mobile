import 'package:flutter/material.dart';
import 'package:sms_mobile/models/models.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class MultiplicationTableCell extends StatelessWidget {
   final dynamic value;
  final Color? color;
  const MultiplicationTableCell({
    this.value,
    this.color,
  });
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
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}

class TableHead extends StatelessWidget {
  List<String> head = ["Full mark","quiz", "Exam","Test","Oral","Total mark"];
  final ScrollController? scrollController;
  TableHead({
    @required this.scrollController,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          MultiplicationTableCell(
            color: Colors.yellow.withOpacity(0.3),
            value: "Subject",
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(6, (index) {
                return MultiplicationTableCell(
                  color: Colors.yellow.withOpacity(0.3),
                  value: head[index],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class TableBody extends StatefulWidget {
  final ScrollController? scrollController;
  TableBody({
    @required this.scrollController,
  });
  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _firstColumnController;
  ScrollController? _restColumnsController;
  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers!.addAndGet();
    _restColumnsController = _controllers!.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController!.dispose();
    _restColumnsController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: ListView(
            controller: _firstColumnController,
            physics: ClampingScrollPhysics(),
            children: List.generate(6, (index) {
              return MultiplicationTableCell(
                color: Colors.red.withOpacity(0.3),
                value: index + 2,
              );
            }),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: (6) * 80,
              child: ListView(
                controller: _restColumnsController,
                physics: const ClampingScrollPhysics(),
                children: List.generate(6, (y) {
                  return Row(
                    children: List.generate(6, (x) {
                      return MultiplicationTableCell(
                        value: (x + 2) * (y + 2),
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

class MultiplicationTable extends StatefulWidget {
  @override
  _MultiplicationTableState createState() => _MultiplicationTableState();
}

class _MultiplicationTableState extends State<MultiplicationTable> {
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TableHead(
              scrollController: _headController,
            ),
            Expanded(
              child: TableBody(
                scrollController: _bodyController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

