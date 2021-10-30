// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rainbow/constants/constraints.dart';

class signin extends StatelessWidget {
  const signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Please sign-in to view the favorite walls you saved before",
              style: TextStyle(color: Colors.white),
            ),
          ),
          OutlinedButton.icon(
          style: ButtonStyle(side:MaterialStateProperty.all(BorderSide(color: Colors.red
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          )) ),
            
            onPressed: (){}, icon: Icon(Icons.login,color: Colors.red,), label: Text('SIGN-IN',style: TextStyle(color: Colors.red),))
        ],
      ),
    );
  }
}
