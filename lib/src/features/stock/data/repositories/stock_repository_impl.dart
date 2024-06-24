import 'package:flutter/material.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:trakya_arge/src/core/network/base_response.dart';
import 'package:trakya_arge/src/features/stock/data/models/create_stock_model.dart';
import 'package:trakya_arge/src/features/stock/data/models/stock_model.dart';
import 'package:trakya_arge/src/features/stock/data/repositories/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  final RestApiClient apiService;

  StockRepositoryImpl({required this.apiService});

  @override
  Future<BaseResponse<StockModel>> getStockById(String id) async {
    final result = await apiService.get("/Stock/$id");
    return BaseResponse.fromJson(result.data, (response) => StockModel.fromJson(response));
  }

  @override
  Future<BaseResponse<StockModel>> deleteStockById(String id) async {
    final result = await apiService.delete("/Stock/$id");
    return BaseResponse.fromJson(result.data, (p0) => StockModel.fromJson(p0));
  }

  @override
  Future<BaseResponse<List<StockModel>>> getStocks() async {
    await Future.delayed(Durations.extralong3);

    final result = await apiService.get("/Stock/GetStockWithStockType");

    return BaseResponse.fromJson(result.data, (response) {
      response as List<dynamic>;
      return response.map((e) => StockModel.fromJson(e)).toList();
    });
  }

  @override
  Future<BaseResponse<StockModel>> postStock(CreateStockModel createStockModel) async {
    final result = await apiService.post("/Stock", data: createStockModel.toJson());
    return BaseResponse.fromJson(result.data, (response) => StockModel.fromJson(response));
  }

  @override
  Future<BaseResponse<StockModel>> putStock(StockModel stock) async {
    final result = await apiService.put("/Stock", data: stock.toJson());
    if (result.statusCode == 204) {
      return BaseResponse(data: stock, errors: null, statusCode: 204);
    } else {
      return BaseResponse(data: null, errors: ["Status code is not 204"], statusCode: 400);
    }
  }
}
