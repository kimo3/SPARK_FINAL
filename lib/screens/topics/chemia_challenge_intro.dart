
import 'package:flutter/material.dart';
import 'package:spark/screens/topics/chemistry_lab_screen.dart';
import 'package:spark/widgets/custom_button.dart';


class ChemiaChallengeIntro extends StatelessWidget {
  const ChemiaChallengeIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xffDDFFF7), 
           
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            children: [
              
              Container(
                width: 180,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const Row(
                      children: [
                        
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/logo.png'), 
                          radius: 16,
                        ),
                         SizedBox(width: 8),
                         Text(
                          'SPARK Labs',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sparkFont',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                    const Center(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/dr_proton.png'), 
                        radius: 40,
                      ),
                    ),
                    const SizedBox(height: 8),
                   
                    const Text(
                      'Name: Dr. Proton',
                      style: TextStyle(fontFamily: 'sparkFont',fontSize: 12 ),
                    ),
                    const Text(
                      'Designation: Laboratory Specialist',
                       style: TextStyle(fontFamily: 'sparkFont',fontSize: 12 ),
                    ),
                    const Text(
                      'Clearance Level: Omega Clearance',
                       style: TextStyle(fontFamily: 'sparkFont',fontSize: 12 ),
                    ),
                    const Spacer(),
                    
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/barcode.png', 
                          fit: BoxFit.contain,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "This is Dr. Proton. He's not just a genius in the field of chemistry but also a master problem-solver with a passion for discovery. "
                      "Whether it's analyzing mysterious compounds, designing groundbreaking experiments, or tackling the most perplexing chemical puzzles, Dr. Proton is here to guide you every step of the way. "
                      "With his lab as your base of operations, you'll uncover the secrets of science and learn to see the world through the lens of a true chemist. Suit up—adventure awaits!",
                      style: TextStyle(letterSpacing: 3 ,fontSize: 14 ,fontFamily: 'sparkFont'),
                    ),
                    const Spacer(),
                    
                    IntroButton(
                      text: 'Start Exploring',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const  ChemistryLabWidget()),
                        );
                      },
                    ),
               
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
