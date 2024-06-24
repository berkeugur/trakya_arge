import 'package:trakya_arge/src/core/network/base_response.dart';
import 'package:trakya_arge/src/features/stockType/data/models/stock_type_model.dart';

abstract class StockTypesRepository {
  Future<BaseResponse<StockTypeModel>> getStockTypeById(String id);
  Future<BaseResponse<List<StockTypeModel>>> getStockTypes();
  Future<BaseResponse<StockTypeModel>> postStockType({required String code, required String name});
  Future<BaseResponse<StockTypeModel>> putStockType(StockTypeModel stockType);
  Future<BaseResponse<StockTypeModel>> deleteStockTypeId(String id);
}
