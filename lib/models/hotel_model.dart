/*class Hotel {
  Hotel({
    required this.apiVersion,
    required this.lang,
    required this.hotels,
  });
  late final int apiVersion;
  late final String lang;
  late final List<Hotels> hotels;

  Hotel.fromJson(Map<String, dynamic> json){
    apiVersion = json['api_version'];
    lang = json['lang'];
    hotels = List.from(json['hotels']).map((e)=>Hotels.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['api_version'] = apiVersion;
    _data['lang'] = lang;
    _data['hotels'] = hotels.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Hotels {
  Hotels({
    required this.partnerReference,
    required this.name,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.desc,
    required this.amenities,
    required this.url,
    required this.email,
    required this.phone,
    required this.fax,
  });
  late final String partnerReference;
  late final String name;
  late final String street;
  late final String city;
  late final String postalCode;
  late final String state;
  late final String country;
  late final double latitude;
  late final double longitude;
  late final String desc;
  late final List<String> amenities;
  late final String url;
  late final String email;
  late final String phone;
  late final String fax;

  Hotels.fromJson(Map<String, dynamic> json){
    partnerReference = json['partner_reference'];
    name = json['name'];
    street = json['street'];
    city = json['city'];
    postalCode = json['postal_code'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    desc = json['desc'];
    amenities = List.castFrom<dynamic, String>(json['amenities']);
    url = json['url'];
    email = json['email'];
    phone = json['phone'];
    fax = json['fax'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['partner_reference'] = partnerReference;
    _data['name'] = name;
    _data['street'] = street;
    _data['city'] = city;
    _data['postal_code'] = postalCode;
    _data['state'] = state;
    _data['country'] = country;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['desc'] = desc;
    _data['amenities'] = amenities;
    _data['url'] = url;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['fax'] = fax;
    return _data;
  }
}*/
class Hotel{
  final String name;
  final String adres;
  final num id;

  Hotel({required this.name,required this.adres,required this.id});
  factory Hotel.fromJson(dynamic json){
    return Hotel(
      name: json["regionNames"][0]["fullName"],
      adres: json["hotelAddress"][0]["street"],
      id: json["hotelId"],
    );


  }
  static List<Hotel> hotels(List snapshot){
    return snapshot.map((data){
      return Hotel.fromJson(data);
    }).toList();
  }
  String toString(){
    return "Hotel {name: $name, adres:$adres, id:$id}";
  }
}