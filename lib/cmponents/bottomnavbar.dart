import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rainbow/animation/fadeanimation_transition.dart';
import 'package:rainbow/pages/searchpage.dart';
import '../main.dart';
import '../model/list.dart';


class bottomnavbar extends StatefulWidget {
  const bottomnavbar({ Key? key }) : super(key: key);

  @override
  _bottomnavbarState createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  Widget navbar(){
    int _selectedIndex = 0;

  void handle_navbar_change() {

      if(_selectedIndex==1)
      {
        // ignore: prefer_const_constructors
        

        Navigator.push(context, FadeRoute(page:  Searchpage()));
      }
}
  return CurvedNavigationBar(
        

        color: Colors.black,
        backgroundColor: Colors.black,
        buttonBackgroundColor: Colors.black,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
         // ignore: prefer_const_constructors
         Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          // ignore: prefer_const_constructors
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add_circle,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,

          )

          
        
      ],
      onTap: (index){
        _selectedIndex=index;
        print(_selectedIndex);
        handle_navbar_change();
      },
      
      
      );
}


  @override
  Widget build(BuildContext context) {
    return navbar(
      
    );
  }
}
