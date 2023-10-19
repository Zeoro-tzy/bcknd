import 'package:http/http.dart' as http;

class HttpHelper {
  final String _apiKey = "9336752b5ae4605a46d3dd796c16c389";
  final String _baseUrl = "https://api.themoviedb.org/3/movie";

  Future<String> getMoviesByCategory(String category) async {
    final String url = '$_baseUrl/$category?api_key=$_apiKey';
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Failed to fetch data';
    }
  }
}
