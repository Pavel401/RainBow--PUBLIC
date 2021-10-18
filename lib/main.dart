// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rainbow/pages/StaggedGridView.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/model/list.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

Map result = {};
Map result_final = {};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  fetchapi() async {
    await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=amoled wallpaper black dark&per_page=80'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001aaeacbabef4c4c6085b4432c1b2a287f'
        }).then((value) {
      result = jsonDecode(value.body);
      //print(result);
      setState(() {
        images = result['photos'];
      });
      //print(images[0]);
      print(images.length);
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();

    fetchapi();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
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
          // ignore: prefer_const_literals_to_create_immutables

          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'RainBow',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(Icons.notifications_outlined),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            Icon(Icons.grid_view_outlined),
          ],
        ),
        backgroundColor: Colors.black,
        // ignore: prefer_const_literals_to_create_immutables
        body: TabBarView(children: [
          StaggedGridView(),
          StaggedGridView(),
          StaggedGridView(),
        ]),
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          dotIndicatorColor: Colors.pink,
          currentIndex: _selectedIndex,
          onTap: (index) {
            print(_selectedIndex);
            setState(() {
              
              _selectedIndex = index;
            });
          },
          items: [
            DotNavigationBarItem(icon: Icon(Icons.home,size: 30,)),
            DotNavigationBarItem(icon: Icon(Icons.search,size: 30,)),
            DotNavigationBarItem(icon: Icon(Icons.add_circle,size: 30,)),
            DotNavigationBarItem(icon: Icon(Icons.settings,size: 30,)),
                        

          ],
        ),
      ),
    );
  }
}
