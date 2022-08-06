import 'package:flutter/material.dart';
class navBar extends StatelessWidget {
  const navBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.air),
            title: Text("Wind Speed"),
        onTap: (){},
          )
        ],),
    );
  }
}