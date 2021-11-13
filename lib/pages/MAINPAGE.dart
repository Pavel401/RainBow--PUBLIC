
// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rainbow/constants/constraints.dart';
import 'package:rainbow/pages/StaggedGridView.dart';
import 'package:rainbow/pages/categories.dart';
import 'package:rainbow/pages/signin.dart';


class MAINPAGE extends StatefulWidget {
  const MAINPAGE({ Key? key }) : super(key: key);

  @override
  _MAINPAGEState createState() => _MAINPAGEState();
}

class _MAINPAGEState extends State<MAINPAGE> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
backgroundColor: backgroundcolor,
      
           
          
          
        
         body: Column(
           children: [
             TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,

            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              Tab(
                icon: Icon(
                  Icons.image_outlined,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.portrait_outlined,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.collections_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          Expanded(child: TabBarView(children: [
          StaggedGridView(),
          signin(),
            categoris(),
        ]),)
           ],
         

           
         ),
       
      ),
      
    );
  }
}