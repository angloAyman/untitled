// lib/services/data_service.dart
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/models/user.dart';

class DataService {
  Future<String> _getLocalFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/data.json';
  }

  Future<File> _getLocalFile() async {
    final path = await _getLocalFilePath();
    return File(path);
  }

  Future<List<User>> loadJsonData() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        final fileContent = await file.readAsString();
        return User.fromJsonList(fileContent);
      } else {
        // Load initial data from assets if the file does not exist
        final String response = await rootBundle.loadString('assets/data.json');
        return User.fromJsonList(response);
      }
    } catch (e) {
      throw Exception('Error loading data: $e');
    }
  }

  Future<void> saveJsonData(List<User> users) async {
    final file = await _getLocalFile();
    final jsonString = User.toJsonList(users);
    await file.writeAsString(jsonString);
  }
}
