// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.sus,
    required this.countStudentInSubject,
    required this.subject,
  });

  int sus;
  List<int> countStudentInSubject;
  List<SubjectElement> subject;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        sus: json["SUS"],
        countStudentInSubject:
            List<int>.from(json["countStudentInSubject"].map((x) => x)),
        subject: List<SubjectElement>.from(
            json["subject"].map((x) => SubjectElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "SUS": sus,
        "countStudentInSubject":
            List<dynamic>.from(countStudentInSubject.map((x) => x)),
        "subject": List<dynamic>.from(subject.map((x) => x.toJson())),
      };
}

class SubjectElement {
  SubjectElement({
    required this.id,
    required this.studentNsn,
    required this.subjectCourseCode,
    required this.createdAt,
    required this.updatedAt,
    required this.subject,
  });

  int id;
  String studentNsn;
  String subjectCourseCode;
  DateTime createdAt;
  DateTime updatedAt;
  SubjectSubject subject;

  factory SubjectElement.fromJson(Map<String, dynamic> json) => SubjectElement(
        id: json["id"],
        studentNsn: json["student_nsn"],
        subjectCourseCode: json["subject_course_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subject: SubjectSubject.fromJson(json["subject"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_nsn": studentNsn,
        "subject_course_code": subjectCourseCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subject": subject.toJson(),
      };
}

class SubjectSubject {
  SubjectSubject({
    required this.courseCode,
    required this.fullName,
    required this.nickname,
    required this.majorId,
    required this.semesterId,
    required this.createdAt,
    required this.updatedAt,
  });

  String courseCode;
  String fullName;
  String nickname;
  String majorId;
  String semesterId;
  DateTime createdAt;
  DateTime updatedAt;

  factory SubjectSubject.fromJson(Map<String, dynamic> json) => SubjectSubject(
        courseCode: json["course_code"],
        fullName: json["full_name"],
        nickname: json["nickname"],
        majorId: json["major_id"],
        semesterId: json["semester_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "course_code": courseCode,
        "full_name": fullName,
        "nickname": nickname,
        "major_id": majorId,
        "semester_id": semesterId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
