// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../repository/giphy_repository.dart';

class CustomGridviewGiphy extends StatelessWidget {
  Function(String) onImageSelected;
  CustomGridviewGiphy({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

  final GiphyRepository _giphyRepository = GiphyRepository();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FutureBuilder(
        future: _giphyRepository.getRequest(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
              ),
            );
          } else {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: snapshot.data?['data'].length,
                itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          onImageSelected(snapshot.data!['data'][index]
                              ['images']['fixed_height']['url']);
                          
                        },
                        child: Image.network(
                          snapshot.data!['data'][index]['images']
                              ['fixed_height']['url'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ));
          }
        },
      );
    });
  }
}
