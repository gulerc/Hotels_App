import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotels_app/services/hotel_service.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart'as dom;

import '../models/hotel_model.dart';

class Istanbul extends StatefulWidget {
  const Istanbul({Key? key}) : super(key: key);

  @override
  State<Istanbul> createState() => _IstanbulState();
}

class _IstanbulState extends State<Istanbul> {
  var _hotels;


  void initState(){
    super.initState();
    info();
  }
Future<void> info()async{
    _hotels = (await HotelService.getHotelData()) as List<Hotel>;
    setState(() {

    });
    print(_hotels);
}

  @override
  Widget build(BuildContext context) {
    info();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İstanbul şehri için oteller",
          style: TextStyle(color: Colors.black),
        ),
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
        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
child: Text("${_hotels?.name}"),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
