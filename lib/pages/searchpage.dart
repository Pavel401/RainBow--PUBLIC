// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rainbow/constants/constraints.dart';
import 'package:rainbow/model/VARIABLES.dart';
import 'package:rainbow/pages/search_result.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;


final TextEditingController _controller = TextEditingController();

class searchpage extends StatefulWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  _searchpageState createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = " ";
  }

  @override
  Widget build(BuildContext context) {
    Widget chip(String label_name, Color color) {
      return InputChip(
        onPressed: () {
          _controller.text = label_name;
        },
        label: Text(
          label_name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
        side: BorderSide(color: Colors.white),
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(6.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(label_name[0].toUpperCase()),
        ),
      );
    }

    wrapWidget() {
      return Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: <Widget>[
          chip('Ocean', Colors.black),
          chip('Tigers', Colors.black),
          chip('Pears', Colors.black),
          chip('Sports', Colors.black),
          chip('Nature', Colors.black),
          chip('Amoled', Colors.black),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Replace this container with your Map widget
          lowerbody(),

          Positioned(
            top: 10,
            right: 15,
            left: 15,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                      controller: _controller,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        hoverColor: Colors.black,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusColor: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: InkWell(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onTap: () {
                        if (_controller.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  search_result(val: _controller.text),
                            ),
                          );
                        } else {
                          print("enter query");
                        }

                        print("search clicked");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 15,
            right: 15,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: wrapWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class lowerbody extends StatelessWidget {
  const lowerbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 180,
                ),
              ),
              Image.asset(
                "assets/images/cycle1.png",
                fit: BoxFit.cover,
                width: 400,
                height: 400,
              ),
              Text(
                'Start by typing something in the search box',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



