import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({Key? key}) : super(key: key);

  @override
  State<WelcomePageWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<WelcomePageWidget> {
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
  ];

  final _currentPageNotifier = ValueNotifier<int>(0);

  final _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPageView(),
            _buildCircleIndicator()
          ],
        ));
  }

  _buildPageView() => SizedBox(
      height: 180,
      child: PageView.builder(
          itemCount: images.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(images[index]);
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );

  _buildCircleIndicator() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: images.length,
          currentPageNotifier: _currentPageNotifier,
        ),
    );
  }
