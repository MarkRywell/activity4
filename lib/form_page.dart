import 'package:flutter/material.dart';
import 'package:activity4/student.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  var formKey = GlobalKey<FormState>();

  var selectedGender = '';

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Add Student")
        ),
        body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextFormField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "E.g. 2020302619",
                    labelText: "ID Number"
                ),
                validator: (value) {
                  return value == null || value.isEmpty ? 'Enter ID' : null;
                },

              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "E.g. Mark Rywell G. Gaje",
                    labelText: "Name"
                ),
                validator: (value) {
                  return value == null || value.isEmpty ? 'Enter Name' : null;
                },
              ),
              TextFormField(
                controller: birthdayController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "E.g. 05/31/2001",
                    labelText: "Birthdate"
                ),
                validator: (value) {
                  return value == null || value.isEmpty ? 'Enter Birthdate' : null;
                },
              ),
              TextFormField(
                controller: courseController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "E.g. BSIT",
                    labelText: "Course"
                ),
                validator: (value) {
                  return value == null || value.isEmpty ? 'Enter Course' : null;
                },
              ),
              TextFormField(
                controller: sectionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "E.g. 3R1",
                    labelText: "Section"
                ),
                validator: (value) {
                  return value == null || value.isEmpty ? 'Enter Section' : null;
                },
              ),
              DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                        value: "Male",
                        child: Text("Male")
                    ),
                    DropdownMenuItem(
                        value: "Female",
                        child: Text("Female")
                    ),
                    DropdownMenuItem(
                        value: "Others",
                        child: Text("Others")
                    ),
                  ],
                  onChanged: (value) {
                    selectedGender = value!;
                  }
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {

                    if(formKey.currentState!.validate()){

                      var newStudent  = Student(
                          id: int.parse(idController.text),
                          name: nameController.text,
                          birthday: birthdayController.text,
                          course: courseController.text,
                          section: sectionController.text,
                          gender: selectedGender
                      );
                      Navigator.pop(context, newStudent);
                    }

                  },
                  child: const Text("Submit")
              )
            ],
          ),
        )
    );
  }
}