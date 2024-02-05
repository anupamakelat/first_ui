import 'package:flutter/material.dart';
import 'package:flutter_app_1/login.dart';
import 'package:flutter_app_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_1/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> image = [
    "https://beardstyle.net/wp-content/uploads/2018/03/Cartoon-Character-Gepetto-with-Walrus-Mustache.jpg.webp",
    "https://cdn2.vectorstock.com/i/1000x1000/94/91/fat-male-cartoon-character-vector-47579491.jpg",
    "https://assets-global.website-files.com/5a9ee6416e90d20001b20038/637bdfbcf8e81a0b601155e4_25ym7RjWoQLLa3wd1bm4vkOz8eS5MnsmTdC98ehg--73JZZ6N5iAFx7mnFahCXEtIzyCcuOqPq9Ntpt57SRq8MK00ol6AWl1BpQ0-NsXGKWdLn4Ad8WIpsLOnBF0wYoUy727FlKgBdJlyHgitQmE1J3Qg9VB1DRXN6L6mMi1SdQJL7jSBHbCotN6wd1v1w.jpeg"
  ];
  List<String> name = ["Cute Granpa", "Bolu Bablu", "pinkpanther"];
  List<String> sentence = [
    "Granpa is shoked",
    "Bolu Bablu is happy",
    "Pink Panther in dj look"
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Anupama.k'),
                accountEmail: Text('anupamakelat73@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('asset/anu.jpg'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(ctx) =>profile()));
                },
              ),
              ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Privacy"),
                  onTap: () {}),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Help"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.notifications_active),
                title: Text("Notifications"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  sigout(context);
                },
              )
            ],
          ),
        ),
        body: Expanded(
          child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(image[index]),
                                radius: 21,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(name[index]),
                            ],
                          ),
                        ),
                        Image.network(image[index]),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(' ${sentence[index]}'),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.comment_rounded),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  void sigout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Logout"),
            content: Text("You want to logout this App"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Logouting(context);
                },
                child: Text("Yes"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],
          );
        });
  }

// ignore: non_constant_identifier_names
  void Logouting(BuildContext ctx) async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (ctx) => ScreenLogin()),
      (route) => false, // This line removes all previous routes from the stack
    );
    final shared = await SharedPreferences.getInstance();
    shared.setBool(save_key, false);
  }
}
