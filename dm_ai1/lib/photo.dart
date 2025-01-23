import 'package:flutter/material.dart';

class Photo {
  int id;
  String PhotoName;
  Photo(this.id, this.PhotoName);
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'PhotoName': PhotoName,
    };
    return map;
  }
  Photo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    PhotoName = map['PhotoName'];
  }
}
