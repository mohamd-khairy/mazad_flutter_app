import 'package:flutter/material.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/models/user.dart';
import 'package:plant_app/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _loadUserDetails() async {
    String token = await getToken();
    if (token == '') {
      Navigator.of(context).pushNamed('home');
    } else {
      Api response = await getUser();
      User user = response.data as User;
      if (response.error == null) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        setState(() {
          pref.setInt('userId', user.id ?? 0);
          pref.setString('userName', user.name ?? ' ');
          pref.setString('userImage', user.image ?? ' ');
          pref.setString('userPhone', user.phone ?? ' ');
        });
        Navigator.of(context).pushNamed('home');
      } else {
        logout();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}')));
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
