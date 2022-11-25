import 'package:chat_app/app/repository/image_repository.dart';
import 'package:flutter/material.dart';

class CustomGridviewImages extends StatelessWidget {
  CustomGridviewImages({super.key});

  final ImageRepository _imageRepository = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _imageRepository.getRequest(),
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
    );
  }
}
