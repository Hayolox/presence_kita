// To parse this JSON data, do
//
//     final susQuestionModel = susQuestionModelFromJson(jsonString);

import 'dart:convert';

SusQuestionModel susQuestionModelFromJson(String str) =>
    SusQuestionModel.fromJson(json.decode(str));

String susQuestionModelToJson(SusQuestionModel data) =>
    json.encode(data.toJson());

class SusQuestionModel {
  SusQuestionModel({
    required this.id,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.q5,
    required this.q6,
    required this.q7,
    required this.q8,
    required this.q9,
    required this.q10,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String q1;
  String q2;
  String q3;
  String q4;
  String q5;
  String q6;
  String q7;
  String q8;
  String q9;
  String q10;
  dynamic createdAt;
  dynamic updatedAt;

  factory SusQuestionModel.fromJson(Map<String, dynamic> json) =>
      SusQuestionModel(
        id: json["id"],
        q1: json["Q1"],
        q2: json["Q2"],
        q3: json["Q3"],
        q4: json["Q4"],
        q5: json["Q5"],
        q6: json["Q6"],
        q7: json["Q7"],
        q8: json["Q8"],
        q9: json["Q9"],
        q10: json["Q10"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Q1": q1,
        "Q2": q2,
        "Q3": q3,
        "Q4": q4,
        "Q5": q5,
        "Q6": q6,
        "Q7": q7,
        "Q8": q8,
        "Q9": q9,
        "Q10": q10,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
