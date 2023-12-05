import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screen/scn2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class scn1 extends StatelessWidget {
  scn1({super.key});

  final _us = TextEditingController();

  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/pngwing.com.png',
                    ),
                    radius: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      Text(
                        'Please enter your username and password',
                        style: TextStyle(fontSize: 10, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: _us,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                  ),
                ),
                TextFormField(
                  controller: _pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      ckecklog(context);
                    },
                    child: Text('Login'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ckecklog(BuildContext ctx) async {
    final _user = _us.text;
    final _password = _pass.text;
    if (_user == 'admin' && _password == '1234') {
      final _sharedprefs = await SharedPreferences.getInstance(); //saving datas
      _sharedprefs.setBool(key, true);

      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) {
        //going homepage
        return hom2();
      }));
    } else {
      final _messege = 'user name and password does not match';
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(5),
          content: Text(_messege)));
    }
    // showDialog(
    //     context: ctx,
    //     builder: (ctx1
    //       return AlertDialog(
    //         title: Text('Error'),
    //         content: Text(_messege),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(ctx1).pop();
    //             },
    //             child: Text('Close'),
    //           ),
    //         ],
    //       );
    //     });
  }
}
