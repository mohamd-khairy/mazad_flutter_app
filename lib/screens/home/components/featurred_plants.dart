import 'package:flutter/material.dart';
import 'package:plant_app/api/api.dart';
import 'package:plant_app/services/category_services.dart';

import '../../../constants.dart';

class FeaturedPlants extends StatefulWidget {
  const FeaturedPlants({
    Key key,
  }) : super(key: key);

  @override
  State<FeaturedPlants> createState() => _FeaturedPlantsState();
}

class _FeaturedPlantsState extends State<FeaturedPlants> {
  List<dynamic> data = [];

  _getCategories() async {
    Api response = await getCategories();
    setState(() {
      data = response.data as List<dynamic>;
    });
  }

  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: data
              .map((item) => FeaturePlantCard(
                    image: item['image'],
                    press: () {
                      Navigator.pushReplacementNamed(context, 'mazads',
                          arguments: item);
                    },
                  ))
              .toList()),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
