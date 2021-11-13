import 'package:flutter/material.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/services/mazad_services.dart';

import '../../../constants.dart';

class RecomendsPlants extends StatefulWidget {
  @override
  State<RecomendsPlants> createState() => _RecomendsPlantsState();
}

class _RecomendsPlantsState extends State<RecomendsPlants> {
  List<dynamic> data = [];

  _loadUserDetails() async {
    Api response = await getMazads();
    setState(() {
      data = response.data as List<dynamic>;
    });
  }

  @override
  void initState() {
    _loadUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: data
                  .map((item) => RecomendPlantCard(
                        image: item['images'],
                        title: item['name'],
                        country: item['user']['name'],
                        price: item['price'],
                        press: () {
                          Navigator.pushReplacementNamed(context, 'details',
                              arguments: item);
                        },
                        item: item,
                        price_min_plus: item['price_min_plus'],
                        date_from: item['from'],
                        date_to: item['to'],
                      ))
                  .toList(),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard(
      {Key key,
      this.image,
      this.title,
      this.country,
      this.price,
      this.press,
      this.item,
      this.price_min_plus,
      this.date_from,
      this.date_to})
      : super(key: key);

  final String image, title, price, price_min_plus, date_from, date_to;
  final String country;
  final Function press;
  final Object item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        bottom: kDefaultPadding * 1.5,
      ),
      width: size.width * 0.9,
      child: Column(
        children: <Widget>[
          Image.network(image),
          //Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "$title\n".toUpperCase(),
                                style: Theme.of(context).textTheme.button),
                            TextSpan(
                              text: "$country".toUpperCase(),
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "\$$price\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: kPrimaryColor)),
                            TextSpan(
                              text: "\$$price_min_plus",
                              style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('$date_from'),
                      Spacer(),
                      Text('$date_to'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
