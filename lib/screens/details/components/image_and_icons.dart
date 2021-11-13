import 'package:flutter/material.dart';

class ImageAndIcons extends StatefulWidget {
  final item;

  const ImageAndIcons({
    Key key,
    this.item,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ImageAndIcons> createState() => _ImageAndIconsState();
}

class _ImageAndIconsState extends State<ImageAndIcons> {
// this will keep track of the current page index
  int _pageIndex = 0;

  // this is your page controller, which controls the page transition
  final PageController _controller = new PageController();

  Set<String> _photosList = {
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRqRwpDKN_zJr1C7pPeWcwOa36BtPm4HeLPgA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSgjZ8pw5WLIGMBibVi_g4CMlSE-EOvrLv7Ag&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQUuMIENOhc1DmruZ6SwLc7JtrR6ZMBRAb3jQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRzasDrBHWV-84vxbmlX7MTuz3QHqtT8jtTuA&usqp=CAU'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        // use MediaQuery always, it will always adjust the dimensions
        // according to different screens
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        // here is your stack
        child: Stack(children: [
          // PageView.builder is just the part of PageView, read through
          // Documentation, and you will get to know
          PageView.builder(
              controller: _controller,
              // here you can remove swipe gesture. UNCOMMENT IT
              // physics:new NeverScrollableScrollPhysics()
              onPageChanged: (index) {
                // with each change updating the index of our variable too
                setState(() => _pageIndex = index);
              },
              itemCount: _photosList.length,
              // building the view of our gallery
              itemBuilder: (BuildContext context, int position) {
                return Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    _photosList.elementAt(position))))));
              }),

          // this will come over the images, the icon buttons
          Positioned(
              left: 0.0,
              right: 0.0,
              top: MediaQuery.of(context).size.height * 0.12,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          // checking if we are not on pos = 0
                          // then we can always go back else do nothing
                          if (_pageIndex != 0)
                            _controller.previousPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                        },
                        icon: Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 28.0)),
                    IconButton(
                        onPressed: () {
                          // checking if we are not on pos = photosList.length - 1
                          // we calculate 0 to length-1
                          // then we can always go forward else do nothing
                          if (_pageIndex < _photosList.length - 1)
                            _controller.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                        },
                        icon: Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 28.0)),
                  ]))
        ]));
  }
}
