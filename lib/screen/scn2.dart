import 'package:flutter/material.dart';
import 'package:login_page/screen/messege.dart';
import 'package:login_page/screen/scn1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hom2 extends StatefulWidget {
  const hom2({super.key});

  @override
  State<hom2> createState() => _hom2State();
}

int c = 0;

class _hom2State extends State<hom2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: c,
          onTap: (newindex) {
            setState(() {
              c = newindex;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person')
          ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 205),
            child: Container(
                child: IconButton(
                    onPressed: () {
                      sideopen(context);
                    },
                    icon: Icon(Icons.menu))),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Do you want to logout'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              backlog(context);
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => msg()));
                },
                title: Text('Person $index'),
                subtitle: Text('heyy i am using telegram'),
                leading: index.isEven
                    ? CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/contacts-icon-png-9.jpg'),
                      )
                    : Image(
                        width: 60,
                        image: AssetImage(
                            'assets/images/profile-icon-male-avatar-portrait-casual-person-silhouette-face-flat-design-vector-illustration-58249394.jpg'),
                      ),
                trailing: Text('$index:34PM'),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider(
                thickness: 2,
              );
            },
            itemCount: 16),
      ),
    );
  }

  void backlog(BuildContext context) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear(); //clearing the datas incase back phone home

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => scn1()), (route) => false);
    //to login page
  }

  Future<void> sideopen(BuildContext ctx) async {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return Container(
            height: 200,
            color: const Color.fromARGB(255, 246, 230, 230),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text('Go Back')),
              ],
            ),
          );
        });
  }
}
