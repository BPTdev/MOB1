import 'package:flutter/material.dart';

import '../../constants/design.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: kColors[1],
      body: Center(
        child: Column(children: [
          Row( //Day 1 & 2
            children: [
              Container( //Day 1
                child: Column(
                  children: [
                    Text('Day 1', style: TextStyle(fontSize: 20.0, color: kColors[0])),
                    Text('Icon'),
                    Text('Temp'),
                    Text('Description'),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
