import 'package:flutter/material.dart';
import 'package:flutter_app_1/home.dart';
import 'package:flutter_app_1/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  void initState() {
    super.initState();
    checkLogin(context);
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
                backgroundColor: Colors.blue,
                strokeWidth: 10,
                color: Colors.deepPurple),
            SizedBox(
              height: 20,
            ),
            Text('Loading....')
          ],
        ),
      ),
    );
  }

  void loginPage() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => ScreenLogin()));
  }

  void HomePage() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }


  Future<void> checkLogin(BuildContext) async {
    final _shared = await SharedPreferences.getInstance();
    final _login = _shared.getBool('userlogin');
    if (_login == null || _login == false) {
      loginPage();
    } else {
      HomePage();
    }
  }
}
