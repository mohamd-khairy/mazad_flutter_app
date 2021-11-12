import 'dart:convert';

import 'package:plant_app/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/constants.dart';

Future<Api> getCategories() async {
  Api api = Api();

  try {
    final response = await http
        .get(Uri.parse(categoriesUrl), headers: {'Accept': 'application/json'});

    switch (jsonDecode(response.body)['status']) {
      case true:
        api.data = jsonDecode(response.body)['data'];
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
