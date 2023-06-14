import 'package:flutter/material.dart';

import '../../constants/design.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController
        .dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColors[1],
      ),
      backgroundColor: kColors[1],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: kColors[1]),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: kColors[0],
                    hintText: 'Enter your search',
                  ),
                ),
                SizedBox(height: 16.0),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Container(
                    height: 40.0, // Set the desired height here
                    child: ElevatedButton(
                      onPressed: () {
                        String searchValue = _searchController.text;
                        Navigator.pop(context, searchValue);
                      },
                      child: Text('Search', style: TextStyle(fontSize: 20.0)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
