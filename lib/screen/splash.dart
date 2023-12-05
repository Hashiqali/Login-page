import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screen/scn1.dart';
import 'package:login_page/screen/scn2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class slsh extends StatefulWidget {
  const slsh({super.key});

  @override
  State<slsh> createState() => _slshState();
}

class _slshState extends State<slsh> {
  @override
  void initState() {
    checklogin(); //calling first opening programme
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/pngwing.com.png',
          height: 160,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checklogin() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _key2 = await _sharedprefs.getBool(key); //stored values opening
    if (_key2 == null || _key2 == false) {
      log();
    } else {
      await Future.delayed(Duration(seconds: 1));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => hom2(), // login to home page
        ),
        (route) => false,
      );
    }
  }

  Future<void> log() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => scn1())); //going login page
  }
}
