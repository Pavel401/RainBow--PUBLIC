// TODO Implement this library.// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rainbow/model/VARIABLES.dart';
import 'package:transparent_image/transparent_image.dart';

Map output = {};
List list1 = [];
List list2 = [];

class search_result extends StatefulWidget {
  String query = " ";
  search_result({required this.query, Key? key}) : super(key: key);

  @override
  _search_resultState createState() => _search_resultState();
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

  fetchapis() async {
    await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=' +
            widget.query +
            '&per_page=80'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001aaeacbabef4c4c6085b4432c1b2a287f'
        }).then((value) {
      output = jsonDecode(value.body);
      //print(result);
      setState(() {
        list1 = output['photos'];
      });
      //print(images[0]);
    });
  }

  loadmores() async {
    setState(() {
      page = page + 1;
    });

    String url = 'https://api.pexels.com/v1/search?query=' +
        widget.query +
        '&per_page=80&page=' +
        page.toString();
    print(url);
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001aaeacbabef4c4c6085b4432c1b2a287f'
    }).then((value) {
      output = jsonDecode(value.body);
      list2 = output['photos'];
      //print(result);
      setState(
        () {
          list1.addAll(list2);
        },
      );
      print(list1[0]);
      print(list1.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: _scrollController,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: list1[index]['src']['large'],
              fit: BoxFit.cover,
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
