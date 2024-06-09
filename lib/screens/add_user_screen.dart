// lib/screens/add_user_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/providers/user_provider.dart';

class AddUserScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _PassportNumberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'CitizensName'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال اسم المواطن';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _PassportNumberController,
                decoration: InputDecoration(labelText: 'PassportNumber'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال رقم جواز السفر';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final newUser = User(
                      id: DateTime
                          .now()
                          .millisecondsSinceEpoch, // Unique ID
                      CitizensName: _nameController.text,
                      PassportNumber: _PassportNumberController.text,
                    );
                    final currentUsers = ref
                        .read(userListProvider)
                        .asData
                        ?.value ?? [];

                    // Check for duplicates
                    final userExists = currentUsers.any((user) =>
                    user.PassportNumber == newUser.PassportNumber);
                    if (userExists) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('رقم الجواز موجود بالفعل ......'),
                      ));
                      return;
                    }

                    currentUsers.add(newUser);
                    ref
                        .read(filteredUserListProvider.notifier)
                        .state = currentUsers;
                    // Save the new list to JSON
                    await ref.read(dataServiceProvider).saveJsonData(
                        currentUsers);
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}