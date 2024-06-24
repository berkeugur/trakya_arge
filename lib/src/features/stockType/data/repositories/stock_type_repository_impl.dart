import 'package:flutter/material.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:trakya_arge/src/core/network/base_response.dart';
import 'package:trakya_arge/src/features/stockType/data/models/stock_type_model.dart';
import 'package:trakya_arge/src/features/stockType/data/repositories/stock_type_repository.dart';

class StockTypeRepositoryImpl implements StockTypesRepository {
  final RestApiClient apiService;

  StockTypeRepositoryImpl({required this.apiService});

  @override
  Future<BaseResponse<StockTypeModel>> getStockTypeById(String id) async {
    final result = await apiService.get("/StockType/$id");
    return BaseResponse.fromJson(result.data, (response) => StockTypeModel.fromJson(response));
  }

  @override
  Future<BaseResponse<StockTypeModel>> deleteStockTypeId(String id) async {
    final result = await apiService.delete("/StockType/id", queryParameters: {"id": id});
    return BaseResponse.fromJson(result.data, (response) => StockTypeModel.fromJson(response));
  }

  @override
  Future<BaseResponse<List<StockTypeModel>>> getStockTypes() async {
    await Future.delayed(Durations.extralong3);
    final result = await apiService.get("/StockType");

    return BaseResponse.fromJson(result.data, (response) {
      response as List<dynamic>;
      return response.map((e) => StockTypeModel.fromJson(e)).toList();
    });
  }

  @override
  Future<BaseResponse<StockTypeModel>> postStockType({required String code, required String name}) async {
    final result = await apiService.post("/StockType", data: {
      "code": code,
      "name": name,
    });

    return BaseResponse.fromJson(result.data, (response) => StockTypeModel.fromJson(response));
  }

  @override
  Future<BaseResponse<StockTypeModel>> putStockType(StockTypeModel stockType) async {
    final result = await apiService.put("/StockType", data: stockType.toJson());
    if (result.statusCode == 204) {
      return BaseResponse(data: stockType, errors: null, statusCode: 204);
    } else {
      return BaseResponse(data: null, errors: ["Status code is not 204"], statusCode: 400);
    }
  }
}
