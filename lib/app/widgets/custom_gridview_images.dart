import 'dart:convert';

import 'package:chat_app/app/models/image_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomGridviewImages extends StatelessWidget {
  const CustomGridviewImages({super.key});

  Future<List<ImageEntity>> getRequest() async {
    String url = "https://pixelford.com/api2/images";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    List<ImageEntity> imageList = [];

    for (var listItem in responseData) {
      ImageEntity images = ImageEntity.fromJson(listItem);
      imageList.add(images);
    }

    return imageList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getRequest(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black87,),
            );
          } else {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        snapshot.data![index].urlFullSize,
                        fit: BoxFit.cover,
                      ),
                    ));
          }
        },
      ),
    );
  }
}
