import 'package:flutter/material.dart';
import 'package:activity4/student.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  var formKey = GlobalKey<FormFieldState>();
  List genders = ['Male', 'Female', 'Others'];
  var selectedGender = '';

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController genderController = TextEditingController();

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
                    var valid = formKey.currentState!.validate();

                    if(valid){
                      Student(
                          id: int.parse(idController.text),
                          name: nameController.text,
                          birthday: birthdayController.text,
                          course: courseController.text,
                          section: sectionController.text,
                          gender: selectedGender
                      );

                    }
                  },
                  child: const Text("Submit"))
            ],
          ),
        )
    );
  }
}