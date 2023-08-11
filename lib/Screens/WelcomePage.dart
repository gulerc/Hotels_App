import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotels_app/Screens/KayitOl.dart';
import 'package:hotels_app/Screens/LoginPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 150),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(150),
                topLeft: Radius.circular(150))),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Align(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      image: DecorationImage(
                          image: AssetImage("assets/logo_beyaz.jpg")),
                    ), //shape: BoxShape.circle, color: Colors.white),
                    width: 170,
                    height: 170,
                  ),
                )),
              ],
            ),
            Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 20, top: 180),
                child: Text(
                  "İdeal Oteliniz",
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Tatil buradan sorulur.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )),
            Container(
              padding: EdgeInsets.only(top: 160),
              child: Column(

                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: SizedBox(
                            child: Text(
                          "Giriş yap",
                          style: TextStyle(color: Colors.black),
                        ))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Kayitol()));},
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: SizedBox(
                            child: Text(
                              "Kayıt Ol",
                              style: TextStyle(color: Colors.black),
                            ))),
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
