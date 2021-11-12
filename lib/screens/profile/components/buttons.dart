import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.login),
                label: Text('Join With Us!'),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(Icons.monetization_on_rounded),
                label: Text('My Mazads'),
                onPressed: () {},
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
          Row(
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.red[900],
                ),
                label: Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red[900]),
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
