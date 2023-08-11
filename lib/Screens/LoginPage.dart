import 'package:flutter/material.dart';
import 'package:hotels_app/Screens/HomePage.dart';
import 'package:hotels_app/Screens/KayitOl.dart';
import 'package:hotels_app/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api/google_signin_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController? _email = TextEditingController();
  bool _obscureText = true;
  void SifreGoster(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        brightness: Brightness.light,

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
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              Positioned(
                  child: Align(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(

                   borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                        image: AssetImage("assets/logo_beyaz.jpg")),
                  ),
                    //shape: BoxShape.circle, color: Colors.white),
                  width: 170,
                  height: 170,
                ),
              )),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                controller: _email!,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "E-posta",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                obscureText: _obscureText, //şifrenin icona basınca görünür olup olmaması.

                decoration: InputDecoration(
                  label: Text("Şifre"),
                  icon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: SifreGoster,
                    icon: Icon(Icons.remove_red_eye),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                ),
validator: (value)=> value!.isEmpty ? "Şifre giriniz.":null,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 40),
            child: TextButton(
              onPressed: () {},
              child: Text("Şifrenizi mi unuttunuz?"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text(
                  "Giriş yap",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white60),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
                onPressed: signIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network('http://pngimg.com/uploads/google/google_PNG19635.png',
                        fit:BoxFit.cover),
                    Text(
                      "Google ile giriş yap",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(margin: EdgeInsets.only(top: 130),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hesabınız yok mu?"),
                TextButton(
                  child: Text("Şimdi Kaydolun."),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Kayitol()));},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future signIn()async{
await GoogleSignInApi.login();
  }
}
