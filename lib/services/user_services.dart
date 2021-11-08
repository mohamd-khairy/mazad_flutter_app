import 'dart:convert';

import '../api/api.dart';
import '../constants.dart';
import '../models/user.dart';
import '../models/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


Future<Api> login(String email, String password) async {
  Api api = Api();

  try {
    final response = await http.post(Uri.parse(loginUrl),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});

    switch (response.statusCode) {
      case 200:
        api.data = user_details.fromJson(jsonDecode(response.body));
        break;

      case 422:
        // print(response.body);
        final errors = jsonDecode(response.body);
        api.error = errors['message'];
        break;

      case 401:
        api.error = unauthorized;
        break;
      default:
    }
  } catch (e) {
    api.error = serverError;
  }
  return api;
}

Future<Api> register(
    String name, String email, String password, String phone) async {
  Api api = Api();
  try {
    final response = await http.post(Uri.parse(registerUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    });

    switch (response.statusCode) {
      case 200:
        api.data = successMsg;
        break;

      case 422:
        // print(response.body);
        final errors = jsonDecode(response.body);
        api.error = errors['message'];
        break;

      case 401:
        api.error = unauthorized;
        break;
      default:
    }
  } catch (e) {
    api.error = serverError;
  }
  return api;
}

Future<Api> getUser() async {
  Api api = Api();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(userUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    switch (response.statusCode) {
      case 200:
        api.data = User.fromJson(jsonDecode(response.body));
        break;

      case 422:
        // print(response.body);
        final errors = jsonDecode(response.body);
        api.error = errors['message'];
        break;

      case 401:
        api.error = unauthorized;
        break;
      default:
    }
  } catch (e) {
    api.error = serverError;
  }
  return api;
}

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('user_id') ?? 0;
}
