import 'dart:convert';
import 'package:plant_app/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/constants.dart';
import 'package:plant_app/services/user_services.dart';

Future<Api> getMazads() async {
  Api api = Api();
  try {
    final response = await http
        .get(Uri.parse(mazadsUrl), headers: {'Accept': 'application/json'});

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

Future<Api> getMazadComments(id) async {
  Api api = Api();
  String mazadId = id.toString();
  try {
    final response = await http.get(Uri.parse(commentsUrl + mazadId),
        headers: {'Accept': 'application/json'});
    print(response.body);
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

Future<Api> addMazadComments(id, comment) async {
  Api api = Api();
  String mazadId = id.toString();
  String token = await getToken();
  try {
    final response = await http.post(Uri.parse(addCommentsUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    }, body: {
      'mazad_id': mazadId,
      'price': comment
    });

    print(response.body);
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
