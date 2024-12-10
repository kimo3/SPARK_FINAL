import 'package:flutter/material.dart';
import 'package:spark/screens/terms_and_conditions.dart';
import 'dart:math' as math;
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class CurvedTextButton extends StatelessWidget {
  final double radius;
  final String text;
  final TextStyle textStyle;
  final double startAngle;
  final double rotationAngle;
  final VoidCallback onPressed;

  const CurvedTextButton({
    Key? key,
    required this.radius,
    required this.text,
    required this.textStyle,
    this.startAngle = 0,
    this.rotationAngle = 0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, 

      child: CustomPaint(
        painter: _Painter(
          radius: radius,
          text: text,
          textStyle: textStyle,
          initialAngle: startAngle,
          rotationAngle: rotationAngle,
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final double radius;
  final String text;
  final double initialAngle;
  final TextStyle textStyle;
  final double rotationAngle;

  _Painter({
    required this.radius,
    required this.text,
    required this.textStyle,
    this.initialAngle = 0,
    this.rotationAngle = 0, 
  });

  final _textPainter = TextPainter(textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2 - radius);

    if (initialAngle != 0) {
      final d = 2 * radius * math.sin(initialAngle / 2);
      final rotationAngle = _calculateRotationAngle(0, initialAngle);
      canvas.rotate(rotationAngle);
      canvas.translate(d, 0);
    }

    double angle = initialAngle;
    for (int i = 0; i < text.length; i++) {
      angle = _drawLetter(canvas, text[i], angle);
    }
  }

  double _drawLetter(Canvas canvas, String letter, double prevAngle) {
    _textPainter.text = TextSpan(text: letter, style: textStyle);
    _textPainter.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );

    final double d = _textPainter.width;
    final double alpha = 2 * math.asin(d / (2 * radius)) + rotationAngle;

    final newAngle = _calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);

    _textPainter.paint(canvas, Offset(0, -_textPainter.height));
    canvas.translate(d, 0);

    return alpha;
  }

  double _calculateRotationAngle(double prevAngle, double alpha) =>
      (alpha + prevAngle) / 2;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}



class LeftCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.75, 0); 
    path.quadraticBezierTo(
      size.width,
      size.height / 2,
      size.width * 0.75,
      size.height,
    );
    path.lineTo(0, size.height); 
    path.close(); 
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}



class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class TermsCheckbox extends StatefulWidget {
   const TermsCheckbox({Key? key}) : super(key: key);
  @override
   TermsCheckboxState createState() => TermsCheckboxState();
}

class TermsCheckboxState extends State<TermsCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
         TextButton(
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TermsAndConditions()),
                      );
                        },
                        child: const Text(
                          'Accept terms and conditions',
                          style: TextStyle(fontSize: 12,fontFamily: 'sparkFont', decoration: TextDecoration.underline,),
                        ),
                      ),
      ],
    );
  }
}


class VideoAndPDFWidget extends StatefulWidget {
  final String videoPath;
  final String pdfPath;

  const VideoAndPDFWidget({
    super.key,
    required this.videoPath, 
    required this.pdfPath,   
  });

  @override
  VideoAndPDFWidgetState createState() => VideoAndPDFWidgetState();
}

class VideoAndPDFWidgetState extends State<VideoAndPDFWidget> {
  late VideoPlayerController _videoController;
  final PageController _pageController = PageController();
  Timer? _timer;
  bool _videoFinished = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _videoController.play(); 
      }).catchError((e) {
        debugPrint('Error initializing video player: $e');
      });

    
    _videoController.setLooping(false);

    
    _videoController.addListener(() {
      if (_videoController.value.isInitialized &&
          _videoController.value.position == _videoController.value.duration &&
          !_videoFinished) {
        setState(() {
          _videoFinished = true;
        });
        _startAutoScroll(); 
      }
    });
  }

  
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      try {
        if (_pageController.hasClients && _pageController.page != null) {
          int nextPage = _pageController.page!.round() + 1;

          if (nextPage == 5) {
            _timer?.cancel();
            Navigator.pop(context); 
          } else {
            _pageController.animateToPage(
              nextPage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          }
        }
      } catch (e) {
        debugPrint('Error during auto-scroll: $e');
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _videoController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoFinished
          ? PDFView(
              filePath: widget.pdfPath, 
              onRender: (pages) {
                debugPrint('Total pages: $pages');
              },
              onError: (error) {
                debugPrint('Error rendering PDF: $error');
              },
              onPageError: (page, error) {
                debugPrint('Error on page $page: $error');
              },
              pageSnap: true, 
              swipeHorizontal: false,
              fitPolicy: FitPolicy.BOTH,
            )
          : Center(
              child: _videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    )
                  : const CircularProgressIndicator(),
            ),
    );
  }
}
