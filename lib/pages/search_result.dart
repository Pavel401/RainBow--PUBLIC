// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rainbow/pages/setwallaper.dart';
import 'package:transparent_image/transparent_image.dart';

List list1 = [];
List list2 = [];
Map output = {};

class search_result extends StatefulWidget {
  String val;
  search_result({required this.val, Key? key}) : super(key: key);

  @override
  State<search_result> createState() => _search_resultState();
}

class _search_resultState extends State<search_result> {
  ScrollController _scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchapis();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadmores();
      }
    });
  }

  void fetchapis() async {
    await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=' +
            widget.val +
            '&per_page=80'),
        headers: {
          'Authorization':
              api
        }).then((value) {
      output = jsonDecode(value.body);
      //print(result);
      setState(() {
        list1 = output['photos'];
      });
      //print(images[0]);
    });
  }

  void loadmores() async {
    setState(() {
      page = page + 1;
    });

    String url = 'https://api.pexels.com/v1/search?query=' +
        widget.val +
        '&per_page=80&page=' +
        page.toString();

    //print(url);
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001aaeacbabef4c4c6085b4432c1b2a287f'
    }).then((value) {
      output = jsonDecode(value.body);
      list2 = output['photos'];
      //print(result);
      setState(() {
        list1.addAll(list2);
      });
      // print(list1[0]);
      print(list1.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: _scrollController,
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      itemCount: list1.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) => Wallpaper(
                  pourl: list1[index]['src']['portrait'],
                  url: list1[index]['src']['original'],
                  photographer: list1[index]['photographer'],
                  photographer_url: list1[index]['photographer_url'],
                  avg_color: list1[index]['avg_color'],
                  width: list1[index]['width'],
                  height: list1[index]['height'],
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: list1[index]['src']['large'],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(1, index.isEven ? 1.9 : 1.9);
      },
    );
  }
}
