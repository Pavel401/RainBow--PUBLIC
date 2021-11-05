// TODO Implement this library.// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rainbow/model/VARIABLES.dart';
import 'package:rainbow/pages/setwallaper.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:rainbow/main.dart';

bool _showAppBar = true;

class StaggedGridView extends StatefulWidget {
  const StaggedGridView({Key? key}) : super(key: key);

  @override
  _StaggedGridViewState createState() => _StaggedGridViewState();
}

class _StaggedGridViewState extends State<StaggedGridView> {
  ScrollController _scrollController = ScrollController();
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadmore();
      }
    });
  }

  loadmore() async {
    setState(() {
      page = page + 1;
    });

    String url =
        'https://api.pexels.com/v1/search?query=amoled wallpaper black dark&per_page=80&page=' +
            page.toString();
    print(url);
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001aaeacbabef4c4c6085b4432c1b2a287f'
    }).then((value) {
      result = jsonDecode(value.body);
      image_list = result['photos'];
      //print(result);
      setState(() {
        images.addAll(image_list);
      });
      print(images[0]);
      print(images.length);
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
        return InkWell(
          onTap: () {
            //Instead of using normal Navigator.push()
            //I used Navigator.of(context, rootNavigator: true).push(...) so it will not display previous appbar and navbar from stack.
            //If rootNavigator is set to true, the state from the furthest instance of this class is given instead. Useful for pushing contents above all subsequent instances of Navigator.
            //The rootNavigator: true will get the highest root widget Scaffold or MaterialApp and avoid displaying the BottomNavigationBar.
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) => Wallpaper(
                  url: images[index]['src']['large'],
                  photographer: images[index]['photographer'],
                  photographer_url: images[index]['photographer_url'],
                  avg_color: images[index]['avg_color'],
                  width: images[index]['width'] ,
                  height:  images[index]['height'],
                ),
              ),
            );
          },
          child: Container(
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
                image: images[index]['src']['large'],
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
