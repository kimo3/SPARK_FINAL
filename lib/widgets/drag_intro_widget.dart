import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/helpers/theme.dart';

class DragIntroWidget extends StatefulWidget {
  const DragIntroWidget({super.key});
  @override
  DragSplashScreenState createState() => DragSplashScreenState();
}

class DragSplashScreenState extends State<DragIntroWidget> {
  int currentZone = 0;

  final List<Color> zoneColors = [clip1, clip2, clip3];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          
          GestureDetector(
            onHorizontalDragEnd: (details) {
              setState(() {
              
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  
                  if (currentZone > 0) {
                    currentZone--;
                  }
                } else {
                 
                  if (currentZone < 2) {
                    currentZone++;
                  }
                }
              });
            },
            child: ClipPath(
              clipper: CurvedClipper(),
              child: Container(
                color: zoneColors[currentZone],
                height: height * 0.6, 
                child: buildPurpleZoneContent(width, height),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPurpleZoneContent(double width, double height) {
    List<String> descriptions = [
      "Discover the world of Science, Technology, Engineering, and Math through fun and interactive challenges designed just for kids.",
      "Dive into exciting activities that make learning engaging. Experiment, build, and solve problems while having fun!",
      "Explore different STEM fields and unlock your potential by developing creativity, curiosity, and critical thinking skills."
    ];

    List<String> imagePaths = [
      'assets/astronaut5.png',
      'assets/astronaut2.png',
      'assets/astronaut3.png'
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePaths[currentZone], height: height * 0.25), 
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1), 
          child: Text(
            descriptions[currentZone],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'sparkFont',
              fontSize: width * 0.05, 
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 15,
                width: currentZone == i ? 50 : 15,
                decoration: BoxDecoration(
                  color: currentZone == i ? Colors.pink : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
