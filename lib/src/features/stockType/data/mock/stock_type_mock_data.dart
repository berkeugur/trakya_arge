import 'package:trakya_arge/src/features/stockType/data/models/stock_type_model.dart';

class StockTypeMockData {
  static const List<Map<String, dynamic>> stockTypeJsonList = [
    {"id": 1, "name": "Stock Type 1", "code": "12"},
    {"id": 2, "name": "Stock Type 2", "code": "12"},
    {"id": 3, "name": "Stock Type 3", "code": "12"},
    {"id": 4, "name": "Stock Type 4", "code": "12"},
    {"id": 5, "name": "Stock Type 5", "code": "12"},
    {"id": 6, "name": "Stock Type 6", "code": "12"},
    {"id": 7, "name": "Stock Type 7", "code": "12"},
    {"id": 8, "name": "Stock Type 8", "code": "12"},
    {"id": 9, "name": "Stock Type 9", "code": "12"},
    {"id": 10, "name": "Stock Type 10", "code": "12"},
    {"id": 11, "name": "Stock Type 11", "code": "12"},
    {"id": 12, "name": "Stock Type 12", "code": "12"}
  ];

  static List<StockTypeModel> stockTypeList = stockTypeJsonList.map((e) => StockTypeModel.fromJson(e)).toList();
}
