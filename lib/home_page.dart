import 'package:flutter/material.dart';
import 'package:activity4/details_page.dart';
import 'package:activity4/student.dart';
import 'package:activity4/form_page.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {

  final database;

  const HomePage({Key? key, required this.database}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Student>> students() async {
    // Get a reference to the database.
    final Database db = await widget.database;

    // Query the table for all The Student.
    final List<Map<String, dynamic>> maps = await db.query('students');

    // Convert the List<Map<String, dynamic> into a List<Student>.
    return List.generate(maps.length, (i) {

      return Student(
        id: maps[i]['id'],
        name: maps[i]['name'],
        birthday: maps[i]['birthday'],
        course: maps[i]['course'],
        section:  maps[i]['section'],
        gender:  maps[i]['gender'],
      );
    });
  }

  Future<void> deleteStudent(int id) async {
    // Get a reference to the database.
    final db = await widget.database;

    // Remove the Dog from the database.
    await db.delete(
      'students',
      // Use a `where` clause to delete a specific student.
      where: 'id = ?',
      // Pass the Student's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> updateStudent(Student student) async {
    // Get a reference to the database.
    final db = await widget.database;

    // Update the given Student.
    await db.update(
      'student',
      student.toMap(),
      // Ensure that the Student has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [student.id],
    );
  }

  List <Student> students_list = [];


  void convertFutureListToList() async {
    students_list = await students();
  }


  @override
  void initState(){
    convertFutureListToList();
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity #4'),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
          onPressed: () {

          },),
        ]
      ),
      body: ListView.builder(
          itemCount: students_list.length,
          itemBuilder: (context, index) {
            final user = students_list[index];

            return Dismissible(
                background: Container(
                  color: Colors.blue[200],
                ),
                direction: DismissDirection.endToStart,
                key: Key(user.id.toString()),
                onDismissed: (direction) {
                    deleteStudent(user.id);
                },
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
          onPressed: () async {
            await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FormPage(database: widget.database))
            );
            setState(() {
              convertFutureListToList();
            });

          },
          child: const Icon(Icons.add)
      ),
    );
  }
}