import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);


  List <Map<String,Object>> get charttransaction{
    final wkdays = DateTime.now();

    return List.generate(7, (index) {
      return {'day':'a','sum':44};

    } );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [

        ],

      ),
    );
    
  }
}