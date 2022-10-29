import 'package:flutter/material.dart';
import 'package:activity4/details_page.dart';
import 'package:activity4/student.dart';
import 'package:activity4/form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List <Student> users = [
    Student (
        id : 20200202,
        name: "Mark Gaje",
        birthday: "May 31, 2001",
        course: "BSIT",
        section: "3R1",
        gender: "Male"
    )
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 4'),
      ),

      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            return Dismissible(
                key: Key(user.id.toString()),
                child: ListTile(

                  title: Text(user.name),
                  subtitle: Text('${user.course} - ${user.section}'),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailsPage(userKey : user))
                    );
                  },
                )
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FormPage())
            );
          },
          child: const Icon(Icons.add)
      ),
    );
  }
}