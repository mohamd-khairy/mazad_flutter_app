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

    switch (jsonDecode(response.body)['status']) {
      case true:
        api.data = user_details.fromJson(jsonDecode(response.body)['data']);
        break;

      case false:
        api.error = jsonDecode(response.body)['message'];
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

    switch (jsonDecode(response.body)['status']) {
      case true:
        api.data = successMsg;
        break;

      case false:
        api.error = jsonDecode(response.body)['message'];
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

    switch (jsonDecode(response.body)['status']) {
      case true:
        api.data = User.fromJson(jsonDecode(response.body)['data']);
        break;

      case false:
        api.error = jsonDecode(response.body)['message'];
        logout();
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
  await pref.remove('user');
  await pref.remove('id');
  await pref.remove('userName');
  await pref.remove('userImage');
  return await pref.remove('token');
}

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<Object> getUserData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  final onj = pref.getString('user');
  return jsonDecode(onj);
}

Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('id') ?? '';
}

Future<String> getUserName() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('userName') ?? '';
}

Future<String> getUserImage() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('userImage') ?? '';
}
