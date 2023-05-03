import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Color? mainColor = Colors.indigo[400];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Chernobyl',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/image.png'),
                ),
                Text('Benoit Pierrehumbert', style: TextStyle(fontSize: 25.0)),
                Text('Technicien ES - DEV',
                    style:
                        TextStyle(fontSize: 20.0, fontFamily: 'DoctorGlitch')),
                Container(width: 200.0, height: 1.0, color: Colors.black),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: mainColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '+00 000 00 00',
                          style: TextStyle(color: mainColor, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    height: 20.0,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: mainColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'W@W.W',
                          style: TextStyle(color: mainColor, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
