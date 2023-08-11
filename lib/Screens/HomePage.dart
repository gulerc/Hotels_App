import 'package:flutter/material.dart';
import 'package:hotels_app/Screens/Harita.dart';
import 'package:hotels_app/Sehirler/Istanbul.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

//import '../models/hotel_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //List<HotelModel> hotel_model = [];
  TextEditingController _dateController = TextEditingController();
  TextEditingController _dateController1 = TextEditingController();

  void initState() {
    _dateController.text = ""; //set the initial value of text field
  //  getWebsiteData();
    super.initState();
  }

  /*Future getWebsiteData() async {
    final url = Uri.parse(
        "https://tr.hotels.com/co10233176/turkiye-ulkesindeki-oteller/");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll(
            "div:nth-child(1) > div:nth-child(2) > div:nth-child(2)")
        .map((element) => element.innerHtml.trim())
        .toList();
    /*  final urls = html
        .querySelectorAll(
            "")
        .map((element) =>
            "https://www.trivago.com.tr/${element.attributes["href"]}")
        .toList();*/
    final urlImages = html
        .querySelectorAll("img:nth-child(1)")
        .map((element) => element.attributes["src"]!)
        .toList();
    print("Count:${titles.length}");
    setState(() {
      hotel_model = List.generate(
          titles.length,
          (index) => HotelModel(
              url: "", //urls[index],
              title: titles[index],
              urlImages: "" //urlImages[index]
              ));
    });
    for (final title in titles) {
      debugPrint(title);
    }
  }*/

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black12),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: TextFormField(
                          //maxLength: 20, //harf sınırı
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_on),
                            iconColor: Colors.black,
                            border: OutlineInputBorder(),
                            label: Text("Gidilecek Yer"),
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(
                            width: 150,
                            height: 40,
                            child: TextFormField(
                              controller: _dateController,
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2030))
                                    .then((selectedDate) {
                                  if (selectedDate != null) {
                                    _dateController.text =
                                        DateFormat('dd/MM/yyyy')
                                            .format(selectedDate);
                                  }
                                });
                              },
                              //maxLength: 20, //harf sınırı
                              readOnly: true,
                              decoration: InputDecoration(
                                iconColor: Colors.black,
                                border: OutlineInputBorder(),
                                label: Text("Giriş Tarihi"),
                              ),
                            )),
                        SizedBox(
                            width: 150,
                            height: 40,
                            child: TextFormField(
                              controller: _dateController1,
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2030))
                                    .then((selectedDate) {
                                  if (selectedDate != null) {
                                    _dateController1.text =
                                        DateFormat('dd/MM/yyyy')
                                            .format(selectedDate);
                                  }
                                });
                              },
                              readOnly: true,
                              //maxLength: 20, //harf sınırı
                              decoration: InputDecoration(
                                iconColor: Colors.black,
                                border: OutlineInputBorder(),
                                label: Text("Çıkış Tarihi"),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Search"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          elevation: MaterialStateProperty.all(15),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5))) //search butonunun kıvrımlı olması.
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 22, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "En Çok Tercih Edilen Şehirler",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text("Daha Fazla"))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 20,
                    left: 22,
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Istanbul()));},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://imgcy.trivago.com/c_fill,d_dummy.jpeg,e_sharpen:60,f_auto,h_258,q_auto,w_258/categoryimages/15/28/15288_v43.jpeg",
                                width: 110,
                                height: 110,
                              ),
                              Text(
                                "İstanbul",
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Istanbul()));},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://imgcy.trivago.com/c_fill,d_dummy.jpeg,e_sharpen:60,f_auto,h_258,q_auto,w_258/categoryimages/15/24/15247_v17.jpeg",
                                width: 110,
                                height: 110,
                              ),
                              Text(
                                "Antalya",
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Istanbul()));},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://imgcy.trivago.com/c_fill,d_dummy.jpeg,e_sharpen:60,f_auto,h_258,q_auto,w_258/categoryimages/15/26/15260_v12.jpeg",
                                width: 110,
                                height: 110,
                              ),
                              Text(
                                "Bodrum",
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Istanbul()));},
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://imgcy.trivago.com/c_fill,d_dummy.jpeg,e_sharpen:60,f_auto,h_258,q_auto,w_258/categoryimages/15/31/15318_v33.jpeg",
                                width: 110,
                                height: 110,

                              ),
                              Text(
                                "Marmaris",
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Istanbul()));},
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://imgcy.trivago.com/c_fill,d_dummy.jpeg,e_sharpen:60,f_auto,h_258,q_auto,w_258/categoryimages/15/24/15245_v36.jpeg",
                                width: 110,
                                height: 110,
                              ),
                              Text(
                                "Ankara",
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  /*child: Container(
                     /* child: ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: hotel_model.length,
                          itemBuilder: (context, index) {
                            final hotel = hotel_model[index];
                            return ListTile(
                             /* leading: Image.network(
                                hotel.urlImages,
                                width: 50,
                                fit: BoxFit.fitHeight,
                              ),*/
                              title: Text(hotel.title),
                              // subtitle: Text(hotel.url),
                            );
                          }),*/
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                      ),
                  ),*/
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
