// To parse this JSON data, do
//
//     final sessionPratikumModel = sessionPratikumModelFromJson(jsonString);

import 'dart:convert';

SessionPratikumModel sessionPratikumModelFromJson(String str) =>
    SessionPratikumModel.fromJson(json.decode(str));

String sessionPratikumModelToJson(SessionPratikumModel data) =>
    json.encode(data.toJson());

class SessionPratikumModel {
  SessionPratikumModel({
    required this.presence,
    required this.permission,
    required this.alpha,
    required this.statusSession,
    required this.sessions,
    required this.roles,
  });

  int presence;
  int permission;
  int alpha;
  List<String> statusSession;
  List<Session> sessions;
  String roles;

  factory SessionPratikumModel.fromJson(Map<String, dynamic> json) =>
      SessionPratikumModel(
        presence: json["presence"],
        permission: json["permission"],
        alpha: json["alpha"],
        statusSession: List<String>.from(json["status_session"].map((x) => x)),
        sessions: List<Session>.from(
            json["sessions"].map((x) => Session.fromJson(x))),
        roles: json["roles"],
      );

  Map<String, dynamic> toJson() => {
        "presence": presence,
        "permission": permission,
        "alpha": alpha,
        "status_session": List<dynamic>.from(statusSession.map((x) => x)),
        "sessions": List<dynamic>.from(sessions.map((x) => x.toJson())),
        "roles": roles,
      };
}

class Session {
  Session({
    required this.id,
    required this.qrCode,
    required this.title,
    required this.start,
    required this.finish,
    required this.date,
    required this.studentNsn,
    required this.semesterId,
    required this.classroomspratikumId,
    required this.year,
    required this.roomId,
    required this.geolocation,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
    required this.room,
  });

  int id;
  String qrCode;
  String title;
  String start;
  String finish;
  DateTime date;
  String studentNsn;
  String semesterId;
  String classroomspratikumId;
  String year;
  String roomId;
  String geolocation;
  DateTime createdAt;
  DateTime updatedAt;
  Student student;
  Room room;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        qrCode: json["QrCode"],
        title: json["title"],
        start: json["start"],
        finish: json["finish"],
        date: DateTime.parse(json["date"]),
        studentNsn: json["student_nsn"],
        semesterId: json["semester_id"],
        classroomspratikumId: json["classroomspratikum_id"],
        year: json["year"],
        roomId: json["room_id"],
        geolocation: json["geolocation"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        student: Student.fromJson(json["student"]),
        room: Room.fromJson(json["room"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "QrCode": qrCode,
        "title": title,
        "start": start,
        "finish": finish,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "student_nsn": studentNsn,
        "semester_id": semesterId,
        "classroomspratikum_id": classroomspratikumId,
        "year": year,
        "room_id": roomId,
        "geolocation": geolocation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "student": student.toJson(),
        "room": room.toJson(),
      };
}

class Room {
  Room({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String latitude;
  String longitude;
  dynamic createdAt;
  dynamic updatedAt;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt,
        "updated_at": updatedAt,
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
    required this.createdAt,
    required this.updatedAt,
  });

  String nsn;
  String name;
  String generation;
  String majorId;
  String androidId;
  String roles;
  DateTime createdAt;
  DateTime updatedAt;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        nsn: json["nsn"],
        name: json["name"],
        generation: json["generation"],
        majorId: json["major_id"],
        androidId: json["android_id"],
        roles: json["roles"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nsn": nsn,
        "name": name,
        "generation": generation,
        "major_id": majorId,
        "android_id": androidId,
        "roles": roles,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
