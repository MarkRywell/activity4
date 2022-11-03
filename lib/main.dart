import 'package:flutter/material.dart';
import 'home_page.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Activity 4

// Mark Rywell G. Gaje
// John Christian Los Banos

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'student_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, birthday TEXT, course TEXT, section TEXT, gender TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Form Handling",
      home: HomePage(database: database)
  ));
}