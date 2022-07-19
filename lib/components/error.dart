import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String? errorMsg;

  const Error({Key? key, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {},
        child: RichText(
          text: TextSpan(
            text: 'Error Was Occurred ,',
            style: const TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: errorMsg,
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
