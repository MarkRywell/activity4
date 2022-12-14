class Student {

  final int id;
  final String name, birthday, course , section, gender;

  Student({
    required this.id,
    required this.name,
    required this.birthday,
    required this.course,
    required this.section,
    required this.gender});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birthday': birthday,
      'course': course,
      'section': section,
      'gender' : gender
    };
  }

}