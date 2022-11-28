// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/app/repository/image_repository.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomGridviewImages extends StatelessWidget {
  Function(String) onImageSelected;
  CustomGridviewImages({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

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
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Error! ${snapshot.error}',
              style: const TextStyle(color: Colors.black87, fontSize: 17),
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
                    child: GestureDetector(
                      onTap: () {
                        onImageSelected(snapshot.data![index].urlFullSize);
                      },
                      child: Image.network(
                        snapshot.data![index].urlFullSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ));
        }
      },
    );
  }
}
