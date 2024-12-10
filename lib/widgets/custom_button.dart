import 'package:flutter/material.dart';
import 'package:spark/widgets/background_music.dart';


class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: width * 0.175 ), 
        elevation: 4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/google_icon.png', 
            height: width * 0.05  , 
          ),
          
        ],
      ),
    );
  }
}


class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double vertical;
  final double horizontal;
  final String? imgPath;
  final double imgHeight;

  const SettingsButton({
    Key? key,
    required this.onPressed,
    required this.imgHeight,
    required this.imgPath,
    required this.vertical,
    required this.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 254, 254, 254),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            '$imgPath', 
            height: imgHeight,
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}


class MuteButton extends StatefulWidget {
  final String playIconPath;   
  final String pauseIconPath;  
  final double vertical;       
  final double horizontal;     
  final double imgHeight;      

  const MuteButton({
    Key? key,
    required this.playIconPath,
    required this.pauseIconPath,
    required this.vertical,
    required this.horizontal,
    required this.imgHeight,
  }) : super(key: key);

  @override
  State<MuteButton> createState() => MuteButtonState();
}

class MuteButtonState extends State<MuteButton> {
  bool isPlaying = true;

  void toggleMusic() {
    if (isPlaying) {
      BackgroundMusicService().pause(); 
    } else {
      BackgroundMusicService().play(); 
    }
    setState(() {
      isPlaying = !isPlaying; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: toggleMusic,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 254, 254, 254),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(
          vertical: widget.vertical,
          horizontal: widget.horizontal,
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            isPlaying ? widget.playIconPath : widget.pauseIconPath, 
            height: widget.imgHeight,
          ),
          const SizedBox(width: 12),  
        ],
      ),
    );
  }
}

class IntroButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const IntroButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFFFF4081), 
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.8,  
      height: 50,  
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'sparkFont',
            color: textColor,
            fontSize: width * 0.02,  
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}


class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
      iconSize: width * 0.08, 
    );
  }
}
class DateButton extends StatefulWidget {
  final String date;
  final double? hwidth;
  final double? vheight;

  const DateButton({Key? key, required this.date, required this.hwidth, required this.vheight})
      : super(key: key);

  @override
  DateButtonState createState() => DateButtonState();
}

class DateButtonState extends State<DateButton> {
  Color borderColor = Colors.black;

  void _toggleBorderColor() {
    setState(() {
      borderColor = borderColor == Colors.black ? const Color(0xFFF72585) : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double buttonWidth = widget.hwidth ?? width * 0.4; 
    double buttonHeight = widget.vheight ?? width * 0.12; 

    return Container(
      width: buttonWidth, 
      height: buttonHeight, 
      child: TextButton(
        onPressed: _toggleBorderColor,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.3, horizontal: buttonWidth * 0.1),
          side: BorderSide(color: borderColor, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          widget.date,
          style: TextStyle(
            color: Colors.black,
            fontSize: width * 0.05, 
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
    );
  }
}




class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Skip",
        style: TextStyle(
          fontFamily: 'sparkFont',
          color: Colors.white,
          fontSize: width * 0.08, 
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class PlanetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath; 
  final String buttonText; 

  const PlanetButton({
    super.key,
    required this.onPressed,
    required this.imagePath,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: width * 0.175), 
        elevation: 0, 
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath, 
            height: width * 0.09, 
          ),
          const SizedBox(height: 8), 
          Text(
            buttonText, 
            style: TextStyle(
              fontFamily: 'sparkFont',
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: width * 0.02, 
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
