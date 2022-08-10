import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String? errorMsg;

  const Error({Key? key, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            alignment: Alignment.topLeft,
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: SizedBox(),
          ),
          Center(
            child: InkWell(
              onTap: () async {},
              child: RichText(
                textAlign: TextAlign.center,
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
          ),
          Expanded(child: SizedBox())
        ],
      );

  }
}
