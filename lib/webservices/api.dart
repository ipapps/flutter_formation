import 'dart:convert';
import 'dart:io';

import 'package:flutter_formation/webservices/api_response.dart';
import 'package:flutter_formation/webservices/user.dart';
import 'package:http/http.dart' as http;

class API {
  static const mockAPI = "jsonplaceholder.typicode.com";

  Future<ApiResponse<List<User>>> fetchUsers() async {
    return _fetchUsers("/users");
  }

  Future<ApiResponse<List<User>>> fetchWrongUsers() async {
    return _fetchUsers("/userss");
  }

  Future<ApiResponse<List<User>>> _fetchUsers(String path) async {
    final httpClient = http.Client();
    httpClient.send(request)
    
    
    
    
    try {
      await Future.delayed(const Duration(seconds: 1));
      final apiResponse = await http.get(Uri.https(mockAPI, path));
      if (apiResponse.statusCode == 200) {
        final List<dynamic> users = jsonDecode(apiResponse.body);
        return ApiResponse(users.map((e) => User.fromJson(e)).toList(), null);
      } else {
        return ApiResponse(null, Exception("Could not get users : ${apiResponse.statusCode}"));
      }
    } catch (exception) {
      return ApiResponse(null, Exception("Unknown error : $exception"));
    }
  }
}
