import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spark/screens/settings.dart';
import 'package:spark/widgets/custom_button.dart';


class PlanetsWidget extends StatefulWidget {
  const PlanetsWidget({super.key});

  @override
  PlanetsWidgetState createState() => PlanetsWidgetState();
}

class PlanetsWidgetState extends State<PlanetsWidget> {
  final PageController _pageController = PageController();
  Timer? _timer;
  final List<String> _imagePaths = [
    'assets/1.jpg',
    'assets/2.jpg', 
    'assets/3.jpg',
      'assets/4.jpg',
    'assets/5.jpg', 
    'assets/6.jpg',
      'assets/7.jpg',
    'assets/8.jpg', 
    'assets/9.jpg',
      'assets/10.jpg',
   
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      int nextPage = _pageController.page!.round() + 1;
      
      if (nextPage == _imagePaths.length) {
        
        _timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Settings()),
        );
      } else {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_imagePaths[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
           const Positioned(
            bottom: 20,
            right: 20,
            child: NextButton(),
          ),
        ],
      ),
    );
  }
}
