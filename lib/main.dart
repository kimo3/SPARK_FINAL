import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/screens/on_board.dart';
import 'package:spark/widgets/background_music.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  
  final backgroundMusicService = BackgroundMusicService();
  await backgroundMusicService.initialize();
  backgroundMusicService.play();

  runApp(const Spark());
}

class Spark extends StatelessWidget {
  const Spark({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: OnBoardScreen(),
    );
  }
}

