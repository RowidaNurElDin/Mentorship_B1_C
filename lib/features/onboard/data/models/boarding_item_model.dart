import '../../domain/entities/boarding_item.dart';

class BoardingItemModel extends BoardingItem {
  BoardingItemModel(
      {required super.title,
      required super.titleEn,
      required super.content,
      required super.contentEn,
      required super.image});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'titleEn': titleEn,
      'content': content,
      'contentEn': contentEn,
      'image': image,
    };
  }

  factory BoardingItemModel.fromJson(Map<String, dynamic> map) =>
      BoardingItemModel(
          title: map['title'],
          titleEn: map['title_en'],
          content: map['content'],
          contentEn: map['content_en'],
          image: map['image']);
}
