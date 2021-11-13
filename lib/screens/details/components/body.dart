import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/services/mazad_services.dart';

import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatefulWidget {
  final item;

  Body({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var secondColor = Colors.green[100];
  var activeColor = kPrimaryColor;
  var comments = false;

  List commentsData = [];
  void _getComments() async {
    Api response = await getMazadComments(widget.item['id']);

    print(response.data);
    if (response.error == null) {
      setState(() {
        commentsData = response.data as List;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  @override
  void initState() {
    _getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: constraints.copyWith(
            minHeight: constraints.maxHeight,
            maxHeight: double.infinity,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                comments == true ? _comments(context) : _description(context),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: size.width / 2,
                          height: 84,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                comments = false;
                                secondColor = Colors.green[100];
                                activeColor = kPrimaryColor;
                              });
                            },
                            color: activeColor,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width / 2,
                          height: 84,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            color: secondColor,
                            onPressed: () {
                              setState(() {
                                _getComments();
                                comments = true;
                                secondColor = kPrimaryColor;
                                activeColor = Colors.green[100];
                              });
                            },
                            child: Text("Comments"),
                          ),
                        ),
                      ],
                    ),
                    // Your footer widget
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _description(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // Your body widgets here
        ImageAndIcons(size: size, item: widget.item),
        TitleAndPrice(item: widget.item),
        SizedBox(height: kDefaultPadding),
      ],
    );
  }

  Widget _comments(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: commentsData.length > 0
          ? Table(
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(2),
              },
              border: TableBorder.all(color: Colors.black),
              children: commentsData
                  .map((item) => TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(item['user_image']),
                            radius: 27.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 12),
                          child: Center(child: Text(item['user_name'])),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 12),
                          child: Center(child: Text("${item['price']}")),
                        ),
                      ]))
                  .toList(),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
