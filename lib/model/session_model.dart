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
  });

  int presence;
  int permission;
  int alpha;
  List<String> statusSession;
  List<Session> sessions;

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        presence: json["presence"],
        permission: json["permission"],
        alpha: json["alpha"],
        statusSession: List<String>.from(json["status_session"].map((x) => x)),
        sessions: List<Session>.from(
            json["sessions"].map((x) => Session.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "presence": presence,
        "permission": permission,
        "alpha": alpha,
        "status_session": List<dynamic>.from(statusSession.map((x) => x)),
        "sessions": List<dynamic>.from(sessions.map((x) => x.toJson())),
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
    required this.subjectCourseCode,
    required this.year,
    required this.roomId,
    required this.geolocation,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String qrCode;
  String title;
  String start;
  String finish;
  DateTime date;
  String lecturerNip;
  String semesterId;
  String subjectCourseCode;
  String year;
  String roomId;
  String geolocation;
  DateTime createdAt;
  DateTime updatedAt;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        qrCode: json["QrCode"],
        title: json["title"],
        start: json["start"],
        finish: json["finish"],
        date: DateTime.parse(json["date"]),
        lecturerNip: json["lecturer_nip"],
        semesterId: json["semester_id"],
        subjectCourseCode: json["subject_course_code"],
        year: json["year"],
        roomId: json["room_id"],
        geolocation: json["geolocation"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "subject_course_code": subjectCourseCode,
        "year": year,
        "room_id": roomId,
        "geolocation": geolocation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
