
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/hotel_model.dart';



/*class HotelService{
  Future<Hotel> getHotelData() async{
    var uri = Uri.parse("https://advertiser-site.com/api_implementation/hotel_data");
    var response= await http.get(uri);
    try {
      if (response.statusCode ==200){

        return( Hotel.fromJson(jsonDecode(utf8.decode(response.bodyBytes))));


      }
      else{
        throw Exception("veriler gelmiyor");
      }
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }
}*/


/*const axios = require('axios');

const options = {
  method: 'GET',
  url: 'https://hotels-com-provider.p.rapidapi.com/v2/regions',
  params: {
    locale: 'tr_TR',
    query: 'İstanbul hotels',
    domain: 'TR'
  },
  headers: {
    'X-RapidAPI-Key': '561b37adacmsh95018824db74adcp1d73f4jsn50f9562d02b9',
    'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
  }
};

try {
const response = await axios.request(options);
console.log(response.data);
} catch (error) {
console.error(error);
}          */
class HotelService{
  static Future<Hotel> getHotelData() async{
    var uri = Uri.https("hotels-com-provider.p.rapidapi.com","/v2/regions",{
      "locale": 'tr_TR',
      "query": 'İstanbul hotels',
      "domain": 'TR'
    },);

    final response= await http.get(uri, headers:{
      'X-RapidAPI-Key': '561b37adacmsh95018824db74adcp1d73f4jsn50f9562d02b9',
      'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
    } );


    try {
      if (response.statusCode ==200){

        return( Hotel.fromJson(jsonDecode(utf8.decode(response.bodyBytes))));


      }
      else{
        throw Exception("veriler gelmiyor");
      }
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }
}