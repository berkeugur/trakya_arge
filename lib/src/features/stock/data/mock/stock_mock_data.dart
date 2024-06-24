import 'package:trakya_arge/src/features/stock/data/models/stock_model.dart';

class StockMockData {
  static List<Map<String, dynamic>> stockMockJsonData = [
    {
      "id": 1,
      "name": "Stock 1",
      "code": "12",
      "stockType": {"id": 1, "name": "Stock Type 1", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
    {
      "id": 2,
      "name": "Stock 2",
      "code": "12",
      "stockType": {"id": 2, "name": "Stock Type 2", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
    {
      "id": 3,
      "name": "Stock 3",
      "code": "12",
      "stockType": {"id": 3, "name": "Stock Type 3", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
    {
      "id": 4,
      "name": "Stock 4",
      "code": "12",
      "stockType": {"id": 4, "name": "Stock Type 4", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
    {
      "id": 5,
      "name": "Stock 5",
      "code": "12",
      "stockType": {"id": 5, "name": "Stock Type 5", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
    {
      "id": 6,
      "name": "Stock 6",
      "code": "12",
      "stockType": {"id": 6, "name": "Stock Type 6", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
    {
      "id": 7,
      "name": "Stock 7",
      "code": "12",
      "stockType": {"id": 7, "name": "Stock Type 7", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
    {
      "id": 8,
      "name": "Stock 8",
      "code": "12",
      "stockType": {"id": 8, "name": "Stock Type 8", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
    {
      "id": 9,
      "name": "Stock 9",
      "code": "12",
      "stockType": {"id": 9, "name": "Stock Type 9", "code": "12"},
      "status": true,
      "stockTypeId": 1,
      "type": 2,
      "salesKDV": 3.5,
      "sackKilo": 6.5,
      "description": "Lorem ipsum "
    },
  ];

  static List<StockModel> stockModelList = stockMockJsonData.map((e) => StockModel.fromJson(e)).toList();
}
