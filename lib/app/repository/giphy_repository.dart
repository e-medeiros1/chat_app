import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GiphyRepository {
  Future<Map> getRequest() async {
    String url =
        "https://api.giphy.com/v1/gifs/trending?api_key=c0l0fEL8EgbrZFg0JaaKOCzV0XoeluEa&limit=20&rating=g";
    try {
      final response = await http.get(Uri.parse(url));

      var responseData = json.decode(response.body);

      return responseData;
    } catch (e) {
      log('API is not working properly');
      throw Exception('API is not working properly');
    }
  }
}
