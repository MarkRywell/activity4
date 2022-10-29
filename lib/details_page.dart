import 'package:activity4/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:activity4/student.dart';

class DetailsPage extends StatelessWidget {

  final Student userKey;

  const DetailsPage({required this.userKey, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Details")),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          TextCustom(textTitle: "ID Number", data: userKey.id.toString()),
          TextCustom(textTitle: "Name", data: userKey.name),
          TextCustom(textTitle: "Birthday", data: userKey.birthday),
          TextCustom(textTitle: "Gender", data: userKey.gender),
          TextCustom(textTitle: "Year & Section", data: userKey.section),
          TextCustom(textTitle: "Course", data: userKey.course),
        ],
      ),
    );
  }
}