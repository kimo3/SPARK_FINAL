import 'package:flutter/material.dart';

class ExperimentScreen extends StatefulWidget {
  @override
  ExperimentScreenState createState() => ExperimentScreenState();
}

class ExperimentScreenState extends State<ExperimentScreen> {
  int _step = 0;
  String _beakerImage = 'assets/beaker.png'; 

  
  void _handleDrop(String item) {
    if (_step == 0 && item == 'soda') {
      setState(() {
        _step++;
      });
    } else if (_step == 1 && item == 'vinegar') {
      setState(() {
        _beakerImage = 'assets/beaker_reaction.png'; 
        _step = 0; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.grey[300], 
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/wood_table.png', 
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
               
                Positioned(
                  top: 100,
                  child: DragTarget<String>(
                    onAccept: (item) => _handleDrop(item),
                    builder: (context, candidateData, rejectedData) {
                      return GestureDetector(
                        onTap: () {},
                        child: Image.asset(_beakerImage, width: 100, height: 100),
                      );
                    },
                  ),
                ),
                
                Positioned(
                  left: 50,
                  bottom: 70,
                  child: Draggable<String>(
                    data: 'soda',
                    feedback: Image.asset(
                      'assets/baking_soda.png',
                      width: 70,
                      height: 70,
                      color: Colors.blue.withOpacity(0.5),
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    child: Image.asset('assets/baking_soda.png', width: 70, height: 70),
                  ),
                ),
                
                Positioned(
                  right: 50,
                  bottom: 70,
                  child: Draggable<String>(
                    data: 'vinegar',
                    feedback: Image.asset(
                      'assets/vinegar.png',
                      width: 70,
                      height: 70,
                      color: Colors.blue.withOpacity(0.5),
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    child: Image.asset('assets/vinegar.png', width: 70, height: 70),
                  ),
                ),
              
                Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Hint"),
                            content: const Text("Drag vinegar and baking soda to the beaker in the correct sequence."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.help_outline, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
