import 'package:flutter/material.dart';


const baseUrl = 'http://mazad-app.herokuapp.com/api';

//api
const loginUrl = baseUrl + '/login';
const registerUrl = baseUrl + '/register';
const forgetPasswordUrl = baseUrl + '/forget-password';
const newPasswordUrl = baseUrl + '/new-password';
const userUrl = baseUrl + '/user';

//response
const successMsg = 'Success';
const unauthorized = 'UnAuthorized';
const serverError = 'Server Error';
const somethingWrong = 'Some Thing Wrong';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;
