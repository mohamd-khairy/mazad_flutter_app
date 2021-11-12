import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/models/user_details.dart';
import 'package:plant_app/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  void _loginFunction() async {
    Api response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as user_details);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(user_details user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', user.token ?? ' ');
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // It will cover 20% of our total height
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: kDefaultPadding + 30,
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 18 + kDefaultPadding,
            ),
            height: widget.size.height * 0.6,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Join With Us!',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Image.asset("assets/images/logo.png")
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: txtEmail,
                            validator: (val) =>
                                val.isEmpty ? 'invalid email address' : null,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.email,
                          color: kPrimaryColor,
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: txtPassword,
                            validator: (val) =>
                                val.isEmpty ? 'invalid password' : null,
                            obscureText: true,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // surffix isn't working properly  with SVG
                              // thats why we use row
                              // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.password,
                          color: kPrimaryColor,
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minWidth: 250,
                      color: Colors.blue[400],
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          _loginFunction();
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            )),
                        Text(' | '),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Your Password',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
