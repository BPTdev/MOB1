import 'package:flutter/material.dart';
import '/models/location.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your search',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                String searchValue = _searchController.text;
                // Handle submit button press with the searchValue
                getLocationByName(searchValue).then((value) {

                });
              },
              icon: Icon(Icons.search),
              label: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
