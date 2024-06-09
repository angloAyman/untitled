// lib/providers/user_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/services/data_service.dart';

final dataServiceProvider = Provider((ref) => DataService());

final userListProvider = FutureProvider<List<User>>((ref) async {
  final dataService = ref.read(dataServiceProvider);
  return dataService.loadJsonData();
});

final filteredUserListProvider = StateProvider<List<User>>((ref) => []);
