import 'package:flutter/material.dart';
import 'package:flutter_app_1/splash.dart';

 const save_key='userlogin';
void main(){
  runApp (MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (debugShowCheckedModeBanner: false,
      title: "Demo app",
    home:SplashScreen()
    );
    

  }
}


