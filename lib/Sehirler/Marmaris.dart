import 'package:flutter/material.dart';
class Marmaris extends StatefulWidget {
  const Marmaris({Key? key}) : super(key: key);

  @override
  State<Marmaris> createState() => _MarmarisState();
}

class _MarmarisState extends State<Marmaris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
        "Antalya şehri için",
        style: TextStyle(color: Colors.black),
      ),
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
      ),
    ),);
  }
}
