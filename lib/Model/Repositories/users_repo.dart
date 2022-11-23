import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:productbox_flutter_exercise/Model/Controllers/users_controller.dart';
import 'package:productbox_flutter_exercise/Model/Models/users_model.dart';

class LogInRepo {
  static Future<int?> fetchSingleEmployeeDetails({required String userName, required String email}) async {
      final String? apiUrl = 'https://jsonplaceholder.typicode.com/users?username=$userName&email=$email';

    try {
      final response = await http.get(Uri.parse(apiUrl!),);

      if (response.statusCode == 200) {
        debugPrint('Users List : ${response.body}');
        UsersController.data = usersListModelFromJson(response.body);
      } else {
        debugPrint('Users list else statement: ${response.body}');
      }
      return response.statusCode;
    } on SocketException catch (e) {
      debugPrint('Users List Socket Exception $e');

      return 10;
    } on Exception catch (e) {
      debugPrint('UsersList Exception $e');
      return 0;
    }
   }
}