import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/services/mazad_services.dart';

import '../../../constants.dart';

class SearchResult extends StatefulWidget {
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<dynamic> data = [];
  List filterData = [];

  _loadUserDetails() async {
    Api response = await getMazads();
    setState(() {
      data = filterData = response.data as List<dynamic>;
    });
  }

  _filterBySearchText(value) {
    setState(() {
      filterData = data
          .where((element) =>
              element['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    _loadUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final item = ModalRoute.of(context).settings.arguments ?? '';

    return ListView(children: [
      Container(
        // It will cover 20% of our total height
        height: size.height * 0.1,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.1,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding),
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
                      initialValue: item,
                      onChanged: (value) {
                        _filterBySearchText(value);
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Search",
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
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: size.height * 0.8,
          child: filterData.length > 0
              ? GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  children: filterData
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
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    ]);
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
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
