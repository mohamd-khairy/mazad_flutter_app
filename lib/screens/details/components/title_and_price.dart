import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    this.item,
  }) : super(key: key);

  final item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("${item['name']}".toUpperCase(),
                  style: Theme.of(context).textTheme.headline4),
              Spacer(),
              Icon(Icons.favorite)
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${item['details']}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: kPrimaryColor.withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Price: "),
                  Text(
                    "\$${item['price']}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Min Bid: "),
                  Text(
                    "\$${item['price_min_plus']}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Start: "),
                  Text(
                    " ${item['from']}",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("End: "),
                  Text(
                    "${item['to']}",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
