
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../widgets/boxes.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Divider(
            height: 2,
            color: Colors.black,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryBox(
                title: 'Starters',
                color: Color(0xFF6741D9),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Screen2(title: 'Main Courses')),
                  );
                },
                child: CategoryBox(
                  title: 'Main course',
                  color: Color(0xFF228BE6),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryBox(
                title: 'Deserts',
                color: Color(0xFF6741D9),
              ),
              CategoryBox(
                title: 'Cocktails',
                color: Color(0xFF6741D9),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


