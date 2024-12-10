import 'package:flutter/material.dart';
import 'package:spark/screens/topics/equation_challenge_screen.dart';
import 'package:spark/screens/topics/experiment_screen.dart';

class ChemistryLabWidget extends StatelessWidget {
  const ChemistryLabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            color: Colors.lightBlue[50],
          ),
          
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChemistryEquationApp()
                        ),
                      );
                  
               
              },
              child: Image.asset(
                'assets/black_board.png', 
                width: 150,
              ),
            ),
          ),
          
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Need Help?"),
                    content: const Text("Step 1: Balance the Equation Click on the blackboard to balance the equation first.\nStep 2: Start the Experiment Once balanced, click on the lab table to begin the experiment!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.help_outline,
                size: 40,
                color: Colors.black,
              ),
            ),
          ),
        
          Positioned(
            bottom: 0,
            left: 20,
            
              child: Image.asset(
                'assets/dr_proton_full.png', 
                width: 100,
              ),
            ),
          
         
          Positioned(
            bottom: 0,
            left: 120,
            right: 20,
            child: GestureDetector(
              onTap: () {
               Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ExperimentScreen()
                        ),
                      );
              },
              child: Image.asset(
                'assets/lab_table.png', 
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


