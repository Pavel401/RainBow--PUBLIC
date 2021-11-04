// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class tabbar extends StatefulWidget {
  const tabbar({ Key? key }) : super(key: key);

  @override
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  @override
  Widget build(BuildContext context) {
    return tab(
      
      
    );
  }
}




 tab(){

  return TabBar(
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
          );
}