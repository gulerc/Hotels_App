import 'package:flutter/material.dart';
class Bodrum extends StatefulWidget {
  const Bodrum({Key? key}) : super(key: key);

  @override
  State<Bodrum> createState() => _BodrumState();
}

class _BodrumState extends State<Bodrum> {
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
