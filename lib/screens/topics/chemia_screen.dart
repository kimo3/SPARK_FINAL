import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/screens/topics/chemia_challenge_intro.dart';
import 'package:spark/widgets/card.dart';
import 'package:spark/widgets/pdf_view_screen.dart';
import 'package:spark/widgets/video_player_screen.dart';

class Chemia extends StatefulWidget {
  const Chemia({Key? key}) : super(key: key);

  @override
  ChemiaState createState() => ChemiaState();
}

class ChemiaState extends State<Chemia> {
  @override
  void initState() {
    super.initState();

    
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/space_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    
                    CustomCard(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoPlayerScreen(
                              videoPath: 'assets/chemia.mp4',
                            ),
                          ),
                        );
                      },
                      text: 'Lesson',
                      textColor: Colors.white,
                      imagePath: 'assets/play_video.png',
                      backgroundColor: const Color(0xff72ddf7),
                    ),
                    const SizedBox(width: 20),
                    CustomCard(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PdfViewerScreen(
                              pdfUrl: 'https://drive.google.com/uc?export=download&id=1kkGR50PMLeh7tc9QZXY3C4tLvw8LT7Yg',
                            ),
                          ),
                        );
                      },
                      text: 'Lesson 2',
                      textColor: Colors.white,
                      imagePath: 'assets/lesson.png',
                      backgroundColor: const Color(0xffa8e6cf),
                    ),
                    const SizedBox(width: 20),
                    CustomCard(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChemiaChallengeIntro(),
                          ),
                        );
                      },
                      text: 'Chemia lab',
                      textColor: Colors.white,
                      imagePath: 'assets/game.png',
                      backgroundColor: const Color(0xffFCE3A0),
                    ),
                    const SizedBox(width: 20),
                    CustomCard(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PdfViewerScreen(
                              pdfUrl: 'https://drive.google.com/file/d/1UA6f0wVvk2PdA46AHZSOtYV6MvFsJfWc/view?usp=drive_link',
                            ),
                          ),
                        );
                      },
                      text: 'Success Story',
                      textColor: Colors.white,
                      imagePath: 'assets/success_icon.png',
                      backgroundColor: const Color(0xffff8fab),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
