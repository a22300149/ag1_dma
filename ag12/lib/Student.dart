class Student{
  String id;
  String nombre;
  String apellido_pat;
  String apellido_mat;
  String tel;
  String mail;


  Student({required this.id,required this.nombre, required this.apellido_pat, required this.apellido_mat, required this.tel, required this.mail});

  factory Student.fromJson(Map<String, dynamic> json){
    return Student(
      id: json['ID'] as String,
      nombre: json['NOMBRE'] as String,
      apellido_pat: json['APELLIDO_PAT'] as String,
      apellido_mat: json['APELLIDO_MAT'] as String,
      tel: json['TEL'] as String,
      mail: json['MAIL'] as String

    );
  }

}