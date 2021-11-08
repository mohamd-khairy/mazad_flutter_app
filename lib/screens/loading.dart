import 'dart:ffi';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/services/user_services.dart';

import '../constants.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _loadUserDetails() async {
    String token = await getToken();

    if (token == '') {
      Navigator.of(context).pushNamed('/');
    } else {
      Api response = await getUser();
      if (response.error == null) {
        Navigator.of(context).pushNamed('/');
      } else if (response.error == unauthorized) {
        Navigator.of(context).pushNamed('login');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$response.error')));
      }
    }
  }

  @override
  void initState() {
    _loadUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
