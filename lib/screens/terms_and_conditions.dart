import 'package:flutter/material.dart';
import 'package:spark/helpers/constantes.dart';

class TermsAndConditions extends StatelessWidget{
      const TermsAndConditions({Key? key}) : super(key: key);

@override
Widget build(BuildContext context){
  return(
     Scaffold(
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child:Container(
        margin: const EdgeInsets.only(left:20),
      child:const Column(
        children: [
           SizedBox(height: 20,),
          Text(termsAndConditionsTitle,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:35,
          ),
          ),
           SizedBox(height: 20,),
             Text(lastUpdated,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),
             Text(acceptanceOfTerms,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),
          SizedBox(height: 20,),
             Text(userEligibility,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),
          SizedBox(height: 20,),
              Text(userAccounts,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),
          SizedBox(height: 20,),
              Text(usageGuidelines,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),
          SizedBox(height: 20,),
              Text(content,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),
          SizedBox(height: 20,),
              Text(inAppAchievements,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),SizedBox(height: 20,),
              Text(dataCollectionPrivacy,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),SizedBox(height: 20,),
              Text(intellectualProperty,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),SizedBox(height: 20,),
              Text(disclaimerOfWarranties,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),SizedBox(height: 20,),
              Text(limitationsOfLiability,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          ),SizedBox(height: 20,),
              Text(changesToTerms,
          style:TextStyle(
            fontFamily:'sparkFont',
            fontSize:25,
          ),
          )

        ],
      )
    )))
  );
}
}