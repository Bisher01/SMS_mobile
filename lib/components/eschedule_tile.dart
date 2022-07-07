import 'package:flutter/material.dart';

class EScheduleTile extends StatefulWidget {
  final bool isSelected;
  const EScheduleTile({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<EScheduleTile> createState() => _EScheduleTileState();
}

class _EScheduleTileState extends State<EScheduleTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.isSelected ? 2 : 1,
      color: widget.isSelected ? Colors.orange : Colors.white,
      child: Column(
        children: [
          Text('S'),
          Text('18'),
          Visibility(
            visible: widget.isSelected,
            child: Icon(
              Icons.add_alert,
            ),
          ),
        ],
      ),
    );
  }
}
