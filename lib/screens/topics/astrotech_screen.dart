import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/widgets/card.dart';
import 'package:spark/widgets/pdf_view_screen.dart';
import 'package:spark/widgets/video_player_screen.dart';

class Astrotech extends StatefulWidget {
  const Astrotech({Key? key}) : super(key: key);

  @override
  AstrotechState createState() => AstrotechState();
}

class AstrotechState extends State<Astrotech> {
  @override
  void initState() {
    super.initState();
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
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
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              CustomCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VideoPlayerScreen(
                        videoPath: 'assets/astro.mp4',
                      ),
                    ),
                  );
                },
                text: 'Lesson',
                textColor: Colors.white,
                imagePath: 'assets/play_video.png',
                backgroundColor: const Color(0xff72ddf7),
              ),

             
              CustomCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfViewerScreen(
                        pdfUrl:
                            'https://drive.google.com/uc?export=download&id=1QptX5G2UwMOcJuJ1v98Yp7aY7CgKg8K4',
                      ),
                    ),
                  );
                },
                text: 'Lesson 2',
                textColor: Colors.white,
                imagePath: 'assets/lesson.png',
                backgroundColor: const Color(0xffa8e6cf),
              ),

              CustomCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfViewerScreen(
                        pdfUrl:
                            'https://drive.google.com/uc?export=download&id=1cmorivT0LUCTzCdXYBgaBIIml67cloAZ',
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
    );
  }
}
