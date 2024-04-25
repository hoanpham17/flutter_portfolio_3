// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/boxes.dart';
import 'screen3.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Screen2 extends StatefulWidget {
  final String title;

  Screen2({required this.title});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  Map<String, dynamic>? recipes;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final data = await loadJsonFromAssets(
        'assets/data/mobile-apps-portfolio-03-recipes.json');
    setState(() {
      recipes = data;
    });
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: recipes != null
          ? Column(
              children: [
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: (recipes!['recipes'] as List).length,
                    itemBuilder: (context, index) {
                      final recipe = recipes!['recipes'][index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Screen3(
                                title: recipe['name'],
                                category: recipe['category'],
                                ingredients:
                                    List<String>.from(recipe['ingredients']),
                              ),
                            ),
                          );
                        },
                        child: CustomBox(
                          title: recipe['name'],
                          color: index.isEven
                              ? Color(0xFF228BE6)
                              : Color(0xFF6741D9),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
