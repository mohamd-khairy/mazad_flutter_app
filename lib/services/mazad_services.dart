import 'dart:convert';
import 'package:plant_app/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/constants.dart';

Future<Api> getMazads() async {
  Api api = Api();
  try {
    final response = await http
        .get(Uri.parse(mazadsUrl), headers: {'Accept': 'application/json'});

    switch (response.statusCode) {
      case 200:
        api.listData = jsonDecode(response.body)['data'];
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
