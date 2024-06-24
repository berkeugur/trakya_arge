import 'package:trakya_arge/src/core/network/base_response.dart';
import 'package:trakya_arge/src/features/stock/data/models/create_stock_model.dart';
import 'package:trakya_arge/src/features/stock/data/models/stock_model.dart';

abstract class StockRepository {
  Future<BaseResponse<StockModel>> getStockById(String id);
  Future<BaseResponse<List<StockModel>>> getStocks();
  Future<BaseResponse<StockModel>> postStock(CreateStockModel createStockModel);
  Future<BaseResponse<StockModel>> putStock(StockModel stockType);
  Future<BaseResponse<StockModel>> deleteStockById(String id);
}
