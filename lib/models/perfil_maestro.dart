// To parse this JSON data, do
//
//     final perfilMaestro = perfilMaestroFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PerfilMaestro perfilMaestroFromJson(String str) =>
    PerfilMaestro.fromJson(json.decode(str));

String perfilMaestroToJson(PerfilMaestro data) => json.encode(data.toJson());

class PerfilMaestro {
  User user;
  Employee employee;
  Position position;
  List<Subject> subjects;

  PerfilMaestro({
    required this.user,
    required this.employee,
    required this.position,
    required this.subjects,
  });

  factory PerfilMaestro.fromJson(Map<String, dynamic> json) => PerfilMaestro(
        user: User.fromJson(json["user"]),
        employee: Employee.fromJson(json["employee"]),
        position: Position.fromJson(json["position"]),
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "employee": employee.toJson(),
        "position": position.toJson(),
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
      };
}

class Employee {
  int id;
  String number;
  String fullName;
  String photo;
  int numHoursWeek;
  int numAvailableHours;
  String phone;
  String academicTitle;
  String speciality;
  DateTime dateJoin;
  DateTime createdAt;
  DateTime updatedAt;
  String user;
  String position;

  Employee({
    required this.id,
    required this.number,
    required this.fullName,
    required this.photo,
    required this.numHoursWeek,
    required this.numAvailableHours,
    required this.phone,
    required this.academicTitle,
    required this.speciality,
    required this.dateJoin,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.position,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        number: json["number"],
        fullName: json["full_name"],
        photo: json["photo"],
        numHoursWeek: json["num_hours_week"],
        numAvailableHours: json["num_available_hours"],
        phone: json["phone"],
        academicTitle: json["academic_title"],
        speciality: json["speciality"],
        dateJoin: DateTime.parse(json["date_join"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "full_name": fullName,
        "photo": photo,
        "num_hours_week": numHoursWeek,
        "num_available_hours": numAvailableHours,
        "phone": phone,
        "academic_title": academicTitle,
        "speciality": speciality,
        "date_join":
            "${dateJoin.year.toString().padLeft(4, '0')}-${dateJoin.month.toString().padLeft(2, '0')}-${dateJoin.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user,
        "position": position,
      };
}

class Position {
  int id;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  Position({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Subject {
  String subject;
  String group;

  Subject({
    required this.subject,
    required this.group,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subject: json["subject"],
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "group": group,
      };
}

class User {
  int id;
  String username;
  String email;
  String name;
  int type;
  String password;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.type,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        type: json["type"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "name": name,
        "type": type,
        "password": password,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
