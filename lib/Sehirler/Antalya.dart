import 'package:flutter/material.dart';
class Antalya extends StatefulWidget {
  const Antalya({Key? key}) : super(key: key);

  @override
  State<Antalya> createState() => _AntalyaState();
}

class _AntalyaState extends State<Antalya> {
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
      ),
    );
  }
}
