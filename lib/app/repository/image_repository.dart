
import 'dart:convert';
import 'dart:developer';

import '../models/image_entity.dart';
import 'package:http/http.dart' as http;
class ImageRepository {
  
  Future<List<ImageEntity>> getRequest() async {
    String url = "https://pixelford.com/api2/images";
    try {
      final response = await http.get(Uri.parse(url));

      var responseData = json.decode(response.body);

      List<ImageEntity> imageList = [];

      for (var listItem in responseData) {
        ImageEntity images = ImageEntity.fromJson(listItem);
        imageList.add(images);
      }

      return imageList;
    } catch (e) {
      log('API is not working properly');
      throw Exception('API is not working properly');
    }
  }

}