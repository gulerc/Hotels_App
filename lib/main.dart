import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hotels_app/Screens/Harita.dart';
import 'package:hotels_app/Screens/WelcomePage1.dart';

import 'package:provider/provider.dart';

import 'Screens/HomePage.dart';
import 'Screens/Profil.dart';
import 'Screens/WelcomePage.dart';

void main()async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const MyApp());


  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
     theme:
      ThemeData(
        primarySwatch: Colors.red,),
        home: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,

          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/logo_beyaz.jpg"),
          ),

          defaultNextScreen: WelcomePage(),
        )// home: WelcomePage(),//MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int seciliSayfa = 0;
  void sayfaDegistir(int index) {
    setState(() {
      seciliSayfa = index;
    });
  }
  static const List<Widget> _widgetOptions = <Widget>[
   HomePage(),
    Harita(),
   Profil(),
  ];

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Hotels"),
        centerTitle: true,
        leading: ImageIcon(
          AssetImage("assets/hotels.png"),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        actions: [
          IconButton(
              onPressed: () {},

              icon: Icon(
                Icons.notifications_active,
                size: 30,
              )),
        ],
        elevation: 10, //gölge efekti
      ),
      body: Center(
        child:  _widgetOptions.elementAt(seciliSayfa),
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.map),label: "Harita"),
          //  BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined),label: "Rezervasyonlar"),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: "Profil"),
        ],
        currentIndex: seciliSayfa,
        selectedItemColor: Colors.red,
        onTap: sayfaDegistir,
      ),
    );
  }
}
