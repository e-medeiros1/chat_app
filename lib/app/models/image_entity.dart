// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageEntity {
  String id;
  String filename;
  String? title;
  String description;
  String urlFullSize;
  String urlMediumSize;
  String urlSmallSize;
  ImageEntity({
    required this.id,
    required this.filename,
    this.title,
    required this.description,
    required this.urlFullSize,
    required this.urlMediumSize,
    required this.urlSmallSize,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) {
    return ImageEntity(
        id: json['id'],
        filename: json['filename'],
        title: json['title'],
        description: json['description'],
        urlFullSize: json['url_full_size'],
        urlMediumSize: json['url_medium_size'],
        urlSmallSize: json['url_small_size']);
  }
}
