import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class Error extends StatelessWidget {
  final String ?errorMsg;


  Error({this.errorMsg});


  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: ()async{

            },

            child:  RichText(
                text: TextSpan(
                  text: 'Error Was Occurred ,',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: this.errorMsg, style: TextStyle(color:Colors.black,)),

                  ],
                ))
        ));
  }
}