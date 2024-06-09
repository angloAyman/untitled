// lib/models/user.dart
import 'dart:convert';

class User {
  int? id;
  String? CitizensName;
  String? PhoneNumber;
  String? PassportNumber;
  String? Nationality;
  String? genre;
  String? Age;
  String? education;
  String? MaritalStatus;
  String?address;
  String? notes;

  User({ this.id,
    this.CitizensName,
    this.PhoneNumber,
    this.PassportNumber,
    this.Nationality,
    this.genre,
    this.Age,
    this.education,
    this.MaritalStatus,
    this.address,
    this.notes,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      CitizensName: json['CitizensName'],
      PhoneNumber: json['PhoneNumber'],
      PassportNumber: json['PassportNumber'],
      Nationality: json['Nationality'],
      genre: json['genre'],
      Age: json['Age'],
      education: json['education'],
      MaritalStatus: json['MaritalStatus  '],
      address: json['address'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'CitizensName':CitizensName,
      'PhoneNumber':PhoneNumber,
      'PassportNumber':PassportNumber,
      'Nationality':Nationality,
      'genre':genre,
      'Age':Age,
      'education':education,
      'MaritalStatus':MaritalStatus,
      'address':address,
      'notes':notes,

    };
  }

  static List<User> fromJsonList(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => User.fromJson(json)).toList();
  }

  static String toJsonList(List<User> users) {
    final List<Map<String, dynamic>> jsonData = users.map((user) => user.toJson()).toList();
    return json.encode(jsonData);
  }
}
