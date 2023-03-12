// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  StudentModel({
    required this.accessToken,
    required this.student,
  });

  String accessToken;
  Student student;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        accessToken: json["access_token"],
        student: Student.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "student": student.toJson(),
      };
}

class Student {
  Student({
    required this.nsn,
    required this.name,
    required this.generation,
    required this.majorId,
    required this.androidId,
    required this.roles,
    this.createdAt,
    this.updatedAt,
    this.major,
  });

  String nsn;
  String name;
  String generation;
  String majorId;
  String androidId;
  String roles;
  DateTime? createdAt;
  DateTime? updatedAt;
  Major? major;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        nsn: json["nsn"],
        name: json["name"],
        generation: json["generation"],
        majorId: json["major_id"],
        androidId: json["android_id"],
        roles: json["roles"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        major: json["major"] == null ? null : Major.fromJson(json["major"]),
      );

  Map<String, dynamic> toJson() => {
        "nsn": nsn,
        "name": name,
        "generation": generation,
        "major_id": majorId,
        "android_id": androidId,
        "roles": roles,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "major": major?.toJson(),
      };
}

class Major {
  Major({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
