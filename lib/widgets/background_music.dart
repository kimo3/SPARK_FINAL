import 'package:just_audio/just_audio.dart';

class BackgroundMusicService {
  static final BackgroundMusicService _instance = BackgroundMusicService._internal();
  late AudioPlayer _backgroundMusicPlayer;

  factory BackgroundMusicService() {
    return _instance;
  }

  BackgroundMusicService._internal() {
    _backgroundMusicPlayer = AudioPlayer();
  }

  Future<void> initialize() async {
    await _backgroundMusicPlayer.setAsset('assets/background_music.mp3');  
    _backgroundMusicPlayer.setLoopMode(LoopMode.one); 
  }

  void play() {
    _backgroundMusicPlayer.play();
  }

  void pause() {
    _backgroundMusicPlayer.pause();
  }

  void stop() {
    _backgroundMusicPlayer.stop();
  }

  void dispose() {
    _backgroundMusicPlayer.dispose();
  }
}
