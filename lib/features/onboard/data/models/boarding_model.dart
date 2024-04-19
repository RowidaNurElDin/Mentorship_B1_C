// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'boarding_item_model.dart';

class BoardingModel {
  final int status;
  final List<BoardingItemModel> boardingItems;
  BoardingModel({
    required this.status,
    required this.boardingItems,
  });

  factory BoardingModel.fromJson(Map<String, dynamic> json) {
    List<BoardingItemModel> _boardingItems = [];

    for (final map in json['data'][0]) {
      _boardingItems.add(BoardingItemModel.fromJson(map));
    }

    return BoardingModel(status: json['status'], boardingItems: _boardingItems);
  }
}
