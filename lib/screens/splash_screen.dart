import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  logicIntro() async {
    final prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    logicIntro();
    Future.delayed(
      const Duration(seconds: 3), () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const home_page())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 300,),
            Text("GET INSPIRE YOUR LIFE WITH\n QUOTER APP",style: TextStyle(color: Colors.green,fontSize: 30,fontWeight: FontWeight.w500),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Lets'go",style: TextStyle(color: Colors.green,fontSize: 20),),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}