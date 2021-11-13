import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/services/user_services.dart';

class Buttons extends StatefulWidget {
  const Buttons({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool loginCheck = false;

  void _checkLogin() async {
    String token = await getToken();

    setState(() {
      if (token == '') {
        loginCheck = true;
      } else {
        loginCheck = false;
      }
    });
  }

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  Widget _buildChild() {
    if (loginCheck) {
      return Row(
        children: [
          TextButton.icon(
            icon: Icon(
              Icons.login,
              color: kPrimaryColor,
            ),
            label: Text('Join With Us!',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
          )
        ],
      );
    }
    return Row(
      children: [
        TextButton.icon(
          icon: Icon(
            Icons.logout_outlined,
            color: Colors.red[900],
          ),
          label: Text(
            'Sign Out!',
            style: TextStyle(
                color: Colors.red[900],
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          onPressed: () {
            logout().then((value) => Navigator.pushNamed(context, 'home'));
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.monetization_on_rounded),
                label: Text('My Mazads'),
                onPressed: () {
                  Navigator.pushNamed(context, 'mazads');
                },
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.favorite),
                label: Text('Favorite'),
                onPressed: () {},
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Divider(
              color: Colors.black26,
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.policy),
                label: Text('Help Center'),
                onPressed: () {},
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.contact_support),
                label: Text('FAQs'),
                onPressed: () {},
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.privacy_tip),
                label: Text('Privacy Policy'),
                onPressed: () {},
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.construction_sharp),
                label: Text('Terms And Conditions'),
                onPressed: () {},
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.info),
                label: Text('About Us'),
                onPressed: () {},
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Divider(
              color: Colors.black26,
            ),
          ),
          _buildChild(),
        ],
      ),
    );
  }
}
