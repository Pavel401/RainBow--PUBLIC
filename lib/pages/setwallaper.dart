// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:custom_full_image_screen/custom_full_image_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:hexcolor/hexcolor.dart';

class Wallpaper extends StatefulWidget {
  String url = " ";
  String photographer = " ";
  String photographer_url = " ";
  String avg_color = " ";
  int width;
  int height;
  Wallpaper(
      {required this.url,
      required this.photographer,
      required this.photographer_url,
      required this.avg_color,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  @override
  Widget build(BuildContext context) {
    Widget _floatingCollapsed() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        ),
        margin: const EdgeInsets.fromLTRB(5.0, 38.0, 5.0, 0.0),
        child: Center(
            child: InkWell(
              onTap: (){
                //todo
              },
              child: Icon(
                      Icons.arrow_upward_sharp,
                      size: 30,
                      color: Colors.white,
                    ),
            )),
      );
    }

    Widget _floatingPanel() {
      return Container(
        margin: EdgeInsets.fromLTRB(5.0, 38.0, 5.0, 20.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          shape: BoxShape.rectangle,
          color: Colors.black.withOpacity(0.8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    print("Save button Clicked");
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.save_alt,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.wallpaper,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 45),
            ),
            Text(
              "Creator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(widget.photographer),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: Text(widget.photographer[0].toUpperCase()),
                  ),
                  backgroundColor: Colors.white,
                ),
                Chip(
                  label: Text("URL"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: Icon(Icons.language),
                  ),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            Text(
              "Colors",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: "assets/fonts/bold.otf"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  label: Text(" "),
                  backgroundColor: HexColor(widget.avg_color),
                ),
                Chip(
                  label: Text(" "),
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            Text(
              "Size",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: "assets/fonts/bold.otf"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                    label: Text(widget.height.toString() +
                        "X" +
                        widget.width.toString()),
                    backgroundColor: Colors.white),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SlidingUpPanel(
        renderPanelSheet: false,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.url), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 60,
              right: 15,
              left: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
