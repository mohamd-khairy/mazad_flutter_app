import 'package:flutter/material.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/body.dart';
import 'package:plant_app/services/mazad_services.dart';
import 'package:plant_app/services/user_services.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Map item = {};

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController txtComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    item = ModalRoute.of(context).settings.arguments;

    String token;
    getToken().then((val) => token = val);

    final int min_bid =
        int.parse(item['price']) + int.parse(item['price_min_plus']);

    void _addNewComment() async {
      Api response = await addMazadComments(item['id'], txtComment.text);

      if (response.error == null) {
        setState(() {
          txtComment.text = '';
          Navigator.pop(context);
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Bid Added Successfully'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Item Details'),
      ),
      body: Body(item: item),
      bottomNavigationBar: MyBottomNavBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            backgroundColor: kPrimaryColor,
            onPressed: () {
              token != ""
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Minimum Bid is ${min_bid}'),
                          content: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              children: [
                                Form(
                                  key: formKey,
                                  child: TextFormField(
                                    controller: txtComment,
                                    keyboardType: TextInputType.number,
                                    validator: (val) =>
                                        val.isEmpty || int.parse(val) < min_bid
                                            ? 'Minimum Bid is ${min_bid}'
                                            : null,
                                    onChanged: (value) {
                                      formKey.currentState.validate();
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Text Field in Dialog"),
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      _addNewComment();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: kPrimaryColor,
                                  ),
                                  label: Text(
                                    'Add Bid',
                                    style: TextStyle(color: kPrimaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : Navigator.pushNamed(context, 'login');
            }),
      ),
    );
  }
}
