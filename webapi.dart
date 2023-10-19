import 'package:flutter/material.dart';
import 'package:latian_flutter_sem/latihanku/api/helper.dart';

class WEBAPI extends StatefulWidget {
  const WEBAPI({Key? key}) : super(key: key);

  @override
  State<WEBAPI> createState() => _WEBAPIState();
}

class _WEBAPIState extends State<WEBAPI> {
  late String result;
  late HttpHelper helper;
  String selectedCategory = 'now_playing';

  @override
  void initState() {
    super.initState();
    helper = HttpHelper();
    result = "";

    fetchMovies(selectedCategory);
  }

  Future<void> fetchMovies(String category) async {
    final String movieData = await helper.getMoviesByCategory(category);
    setState(() {
      result = movieData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Movie'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: <Widget>[
          // Mengganti dropdown menu menjadi DropdownButton
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedCategory = newValue;
                });
                fetchMovies(newValue);
              }
            },
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem(
                value: 'latest',
                child: Text('Latest'),
              ),
              DropdownMenuItem(
                value: 'now_playing',
                child: Text('Now Playing'),
              ),
              DropdownMenuItem(
                value: 'popular',
                child: Text('Popular'),
              ),
              DropdownMenuItem(
                value: 'top_rated',
                child: Text('Top Rated'),
              ),
              DropdownMenuItem(
                value: 'upcoming',
                child: Text('Upcoming'),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text("$result"),
            ),
          ),
        ],
      ),
    );
  }
}
