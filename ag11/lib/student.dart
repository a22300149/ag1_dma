class Student {
  int? id;
  late String firstName;
  late String lastName;

  Student({this.id, required this.firstName, required this.lastName});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'firstname': firstName,
      'lastname': lastName,
    };
    return map;
  }

  Student.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    firstName = map['firstname'] ?? '';  // Asigna una cadena vacía si es null
    lastName = map['lastname'] ?? '';  // Asigna una cadena vacía si es null
  }
}

