// To parse this JSON data, do
//
//     final sessionModel = sessionModelFromJson(jsonString);

import 'dart:convert';

SessionModel sessionModelFromJson(String str) =>
    SessionModel.fromJson(json.decode(str));

String sessionModelToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  SessionModel({
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

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
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
    required this.lecturerNip,
    required this.semesterId,
    required this.classroomsId,
    required this.year,
    required this.roomId,
    required this.geolocation,
    required this.createdAt,
    required this.updatedAt,
    required this.lecturer,
    required this.room,
  });

  int id;
  String qrCode;
  String title;
  String start;
  String finish;
  DateTime date;
  String lecturerNip;
  String semesterId;
  String classroomsId;
  String year;
  String roomId;
  String geolocation;
  DateTime createdAt;
  DateTime updatedAt;
  Lecturer lecturer;
  Room room;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        qrCode: json["QrCode"],
        title: json["title"],
        start: json["start"],
        finish: json["finish"],
        date: DateTime.parse(json["date"]),
        lecturerNip: json["lecturer_nip"],
        semesterId: json["semester_id"],
        classroomsId: json["classrooms_id"],
        year: json["year"],
        roomId: json["room_id"],
        geolocation: json["geolocation"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lecturer: Lecturer.fromJson(json["lecturer"]),
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
        "lecturer_nip": lecturerNip,
        "semester_id": semesterId,
        "classrooms_id": classroomsId,
        "year": year,
        "room_id": roomId,
        "geolocation": geolocation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "lecturer": lecturer.toJson(),
        "room": room.toJson(),
      };
}

class Lecturer {
  Lecturer({
    required this.nip,
    required this.fullName,
    required this.username,
    required this.majorId,
    required this.createdAt,
    required this.updatedAt,
  });

  int nip;
  String fullName;
  String username;
  String majorId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        nip: json["nip"],
        fullName: json["full_name"],
        username: json["username"],
        majorId: json["major_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "full_name": fullName,
        "username": username,
        "major_id": majorId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
