import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/services/user_services.dart';

import '../../../constants.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  void _registerAction() async {
    Api response = await register(
        txtName.text, txtEmail.text, txtPassword.text, txtPhone.text);
    if (response.error == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Register Successfully')));
      Navigator.pushNamed(context, 'login');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // It will cover 20% of our total height
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: kDefaultPadding,
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 0,
            ),
            height: widget.size.height * 0.8,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Form(
              key: formKey,
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
                            controller: txtName,
                            validator: (val) =>
                                val.isEmpty ? 'name is required' : null,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Name",
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
                        Icon(Icons.people, color: kPrimaryColor)
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
                                val.isEmpty ? 'email is required' : null,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Email",
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
                        Icon(Icons.email, color: kPrimaryColor)
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
                            obscureText: true,
                            validator: (val) =>
                                val.isEmpty ? 'password is required' : null,
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
                        Icon(Icons.password, color: kPrimaryColor)
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
                            controller: txtPhone,
                            validator: (val) =>
                                val.isEmpty ? 'phone is required' : null,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Phone",
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
                        Icon(Icons.phone, color: kPrimaryColor)
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
                        if (formKey.currentState.validate()) {
                          _registerAction();
                        }
                      },
                      child: Text(
                        "Register",
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
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text(
                              'Already Have Account? Sign in',
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
